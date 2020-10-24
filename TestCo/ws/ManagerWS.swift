//
//  ManagerWS.swift
//  TestC
//
//  Created by Laddy Carolina Diaz Lamus on 21/10/20.
//

import Foundation
import Alamofire
import Firebase

enum EnvironmentType: Int {
    case local, development, production
}

fileprivate struct Empty: Codable {
}

fileprivate struct CrytptoDTO: Codable {
    var datacrypt: String
}

fileprivate enum CrytptoError: Swift.Error {
    case unknown
}

class ManagerWS {
    private static let datacrypt: String = "datacrypt"
    static let shared = ManagerWS()
    
    private let fiveHundred: Int = 500
    private var defaults = DefaultsConfig.shared
    private static let crypt = CryptLib()
    
    private let session: Session = {
        var configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 40
        return Session(configuration: configuration)
    }()
        
    private func headers(_ socketId: String?) -> HTTPHeaders {
        let language: String = defaults.get(for: defaults.keyLanguage) as? String ?? ""
        let firebaseId = defaults.get(for: defaults.keyFirebaseId) as? String ?? String.empty
        return HTTPHeaders([Constant.default.apiAuthKey  : "DEMO-API-KEY"])
    }
    
    func make<D: Decodable>(url: String,
                            method: HTTPMethod,
                            socketId: String? = nil,
                            completion: @escaping (D?, ErrorDTO?) -> Void) {
        self.make(url: url,
                  method: method,
                  parameters: Empty(),
                  socketId: socketId) { (response: D?, empty: Empty?, error) in
                    completion(response, error)
        }
    }
    
    func make<E: Encodable>(url: String,
                            method: HTTPMethod,
                            parameters: E? = nil,
                            socketId: String? = nil,
                            completion: @escaping (ErrorDTO?) -> Void) {
        self.make(url: url,
                  method: method,
                  parameters: parameters,
                  socketId: socketId) { (response: Empty?, error) in
                    completion(error)
        }
    }
    
    func make<E: Encodable,
              D: Decodable>(url: String,
                      method: HTTPMethod,
                      parameters: E? = nil,
                      socketId: String? = nil,
                      completion: @escaping (D?, ErrorDTO?) -> Void) {
        self.make(url: url,
                  method: method,
                  parameters: parameters,
                  socketId: socketId) { (response: D?, empty: Empty?, error) in
                    completion(response, error)
        }
    }
    
    func make<D: Decodable,//
              F: Decodable>(url: String,
                      method: HTTPMethod,
                      socketId: String? = nil,
                      encrypted: Bool = true,
                      completion: @escaping (D?, F?, ErrorDTO?) -> Void) {
        let headers = self.headers(socketId)
        self.make(url: "https://api.thecatapi.com/v1/breeds",
                  method: method,
                  headers: headers,
                  parameters: Empty(),
                  completion: completion)

    }
    
    func make<E: Encodable,
              D: Decodable,
              F: Decodable>(url: String,
                            method: HTTPMethod,
                            parameters: E? = nil,
                            socketId: String? = nil,
                            encrypted: Bool = true,
                            completion: @escaping (D?, F?, ErrorDTO?) -> Void) {
        let headers = self.headers(socketId)
        self.cypher(parameters, encrypted) { request, cypher in
            guard let cypher = cypher else {
                self.make(url: url,
                          method: method,
                          headers: headers,
                          parameters: parameters,
                          completion: completion)
                return
            }
            self.make(url: url,
                      method: method,
                      headers: headers,
                      parameters: (parameters is Empty) ? nil : cypher) { response, error in
                        guard let response = response else {
                            completion(nil, nil, error)
                            return
                        }
                        self.decrypt(response,
                                     completion: completion)
            }
        }
    }
    
    func make<E: Encodable,
              D: Decodable,
              F: Decodable>(url: String,
                            method: HTTPMethod,
                            headers: HTTPHeaders,
                            parameters: E? = nil,
                            completion: @escaping (D?, F?, ErrorDTO?) -> Void) {
        guard let url = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            return
        }
        session.request(url,
                   method: method,
                   parameters: (parameters is Empty) ? nil : parameters,
                   encoder: JSONParameterEncoder.prettyPrinted,
                   headers: headers)
            .validate()
            .responseDecodable(of: D.self,
                               queue: DispatchQueue.global()) { result in
                guard let response = result.value else {
                    self.toError(status: result.response?.statusCode ?? self.fiveHundred,
                                 data: result.data,
                                 completion: completion)
                    return
                }
                completion(response, nil, nil)
        }
    }
    
    private func make(url: String,
                      method: HTTPMethod,
                      headers: HTTPHeaders,
                      parameters: CrytptoDTO? = nil,
                      completion: @escaping (CrytptoDTO?, ErrorDTO?) -> Void) {
        guard let url = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            return
        }
        session.request(url,
                   method: method,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.prettyPrinted,
                   headers: headers)
            .validate()
            .responseDecodable(of: CrytptoDTO.self,
                               queue: DispatchQueue.global()) { result in
                guard let response = result.value else {
                    self.toError(status: result.response?.statusCode ?? self.fiveHundred,
                                 data: result.data,
                                 completion: completion)
                    return
                }
                completion(response, nil)
        }
    }
    
    private func toError<D: Decodable,
                         F: Decodable>(status: Int,
                                       data: Data?,
                                       completion: @escaping (D?, F?, ErrorDTO?) -> Void) {
        do {
            let error = ErrorDTO(error: "TEXT_ERROR_CONNECTION".localized)
            guard let data = data else {
                completion(nil, nil, error)
                return
            }
            let decoder = JSONDecoder()
            if status == fiveHundred {
                let webError = try decoder.decode(ErrorDTO.self, from: data)
                completion(nil, nil, webError)
            } else {
                let fail = try decoder.decode(F.self, from: data)
                if fail is Empty {
                    completion(nil, nil, error)
                    return
                }
                completion(nil, fail, nil)
            }
        } catch {
            Crashlytics.crashlytics().record(error: error)
            completion(nil, nil, ErrorDTO(error: "TEXT_TITLE_FAIL".localized))
        }
    }
    
    private func toError(status: Int,
                         data: Data?,
                         completion: @escaping (CrytptoDTO?, ErrorDTO?) -> Void) {
        do {
            let error = ErrorDTO(error: "TEXT_ERROR_CONNECTION")
            guard let data = data else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            if status == fiveHundred {
                let webError = try decoder.decode(ErrorDTO.self, from: data)
                completion(nil, webError)
            } else {
                let fail = try decoder.decode(CrytptoDTO.self, from: data)
                completion(fail, nil)
            }
        } catch {
            Crashlytics.crashlytics().record(error: error)
            completion(nil, ErrorDTO(error: "TEXT_TITLE_FAIL".localized))
        }
    }
    
    private func cypher<E: Encodable>(_ cypher: E,
                                      _ encrypted: Bool,
                                      _ completion: (E?, CrytptoDTO?) -> Void)  {
        let environmentType = EnvironmentType(rawValue: Constant.default.environmentType)
        switch environmentType {
        case .local, .development:
            completion(cypher, nil)
        case .production:
            if encrypted {
                encrypt(cypher, completion)
            } else {
                completion(cypher, nil)
            }
        case .none:
            completion(cypher, nil)
        }
    }
    
    private func encrypt<E: Encodable>(_ cypher: E,
                                       _ completion: (E?, CrytptoDTO?) -> Void) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(cypher)
            guard let body = String(data: data,
                                    encoding: .utf8) else {
                                        completion(cypher, nil)
                                        return
            }
            let secrect = KeychainConfig.shared.get(for: Constant.default.secretKey)
            guard let encrypted = ManagerWS.crypt.encryptPlainTextRandomIV(withPlainText: body,
                                                                           key: secrect) else {
                                                                            completion(cypher, nil)
                                                                            return
            }
            return completion(nil, CrytptoDTO(datacrypt: encrypted))
        } catch {
            completion(cypher, nil)
        }
    }
    
    private func decrypt<D: Decodable,
                         F: Decodable>(_ response: CrytptoDTO,
                                       completion: @escaping (D?, F?, ErrorDTO?) -> Void) {
        do {
            let secrect = KeychainConfig.shared.get(for: Constant.default.secretKey)
            guard let decrypted = ManagerWS.crypt.decryptCipherTextRandomIV(withCipherText: response.datacrypt,
                                                                            key: secrect) else {
                                                                                throw CrytptoError.unknown
            }
            completion(self.decrypted(decrypted),
                       self.decrypted(decrypted),
                       nil)
        } catch {
            Crashlytics.crashlytics().record(error: error)
            completion(nil, nil, ErrorDTO(error: "TEXT_TITLE_FAIL".localized))
        }
    }
    
    private func decrypted<D: Decodable>(_ decrypted: String) -> D? {
        do {
            let decoder = JSONDecoder()
            guard let data = decrypted.data(using: .utf8) else {
                return nil
            }
            return try decoder.decode(D.self, from: data)
        } catch {
            return nil
        }
    }
    
    func get(data response: Data) -> Data? {
            var data: Data?
            let environmentType  = EnvironmentType(rawValue: Constant.default.environmentType)
            switch environmentType {
            case .local, .development, .none:
                data = response
            case .production:
                data = decrypt(response)
            }
            return data
    }
    
    func decrypt(_ data: Data) -> Data? {
        guard let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
            return nil
        }
        guard let string = json[ManagerWS.datacrypt] as? String else {
            return nil
        }
        let secrectKey = KeychainConfig.shared.get(for: Constant.default.secretKey)
        guard let decrypted = ManagerWS.crypt.decryptCipherTextRandomIV(withCipherText: string,
                                                                        key: secrectKey) else {
                                                                            return nil
        }
        return decrypted.data(using: .utf8)
    }
    
    func make(url: String,
              success: @escaping (Data) -> Void,
              failure: @escaping (Error) -> Void) {
        session.request(url).response { response in
            guard let data = response.data else {
                failure(response.error!)
                return
            }
            success(data)
        }
    }
    
    func cancel(upload: String) {
        session.session.getTasksWithCompletionHandler { (_, uploadTasks, _) in
            uploadTasks.forEach {
                if $0.currentRequest?.url?.absoluteString == upload {
                    $0.cancel()
                }
            }
        }
    }
    
    
    func cancel(download: String) {
        session.session.getTasksWithCompletionHandler { (_, _, downloadTasks) in
            downloadTasks.forEach {
                if $0.currentRequest?.url?.absoluteString == download {
                    $0.cancel()
                }
            }
        }
    }
    
}
