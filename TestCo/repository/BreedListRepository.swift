//
//  CatsListRepository.swift
//  TestC
//
//  Created by Laddy Carolina Diaz Lamus on 21/10/20.
//

import Foundation
import RealmSwift
import RxRealm

class BreedListRepository {
    
    static let shared = BreedListRepository()
    var errorUtility = ErrorUtility.shared

//    private var connector = SocketConnector.shared
    private var manager = BreedsListWS.shared
    private var database = BreedDB.shared
    private var defaults = DefaultsConfig.shared
    private let contactPathContact: String = "Contact/"
    private var fileManager = FileManager.default
    private let contactName: String = "Contact%@.png"
    
    func load(with id: AnyHashable,
              didChanges: @escaping (RealmChangeset, [BreedModel]) -> Void) {
        database.load(with: id) { contacts, changes in
            didChanges(changes, BreedModel.toModels(entities: contacts.toArray()))
        }
    }
    
//    func sync(success: @escaping ([BreedModel]) -> Void,
//              _ failure: @escaping (String) -> Void) {
////        manager.breedsList(completion: T##([BreedResDTO], BreedsErrorResDTO?, ErrorDTO?) -> Void)
//        manager.breedsList { response, error  in
//            DispatchSyncMainThreadSafe {
//                if error != nil {
//                    failure(error!.error)
//                    return
//                }
//                var contacts: [BreedModel] = []
//                for dto in response {
//                    let contact = BreedModel.toModel(dto: dto)
//                    contacts.append(contact)
//                }
//                success(contacts)
////                self.save(contacts: contacts) //**verify
//
//                success([])
//            }
//        }
//    }
    
    func breeds(page: String? = nil,
                limit: Int? = nil,
                success: @escaping ([BreedModel]) -> Void,
                failure: @escaping (String) -> Void) {
        manager.breedsList(page: page,
                           limit: limit) { dtos, errorRes, error in
            if error != nil {
                failure(error!.error)
                return
            }
            
            if dtos.count > .zero {
                var breeds: [BreedModel] = []
                for dto in dtos {
                    let breed = BreedModel.toModel(dto: dto)
                    breeds.append(breed)
                }
                
                success(breeds)
                return
            }
            let errors = try? errorRes?.allValuesBreedsList()
            let message = self.errorUtility.getMessage(by: errors!)
            failure(message)
        }
    }
    
    
    
//    func contacts(success: @escaping ([BreedModel], [BreedModel]) -> Void,
//                  failure: @escaping (String) -> Void) {
//        let entitites = self.database.contact()
//        let models = BreedModel.toModels(entities: entitites)
//        success(models, [])
//        if models.count != 0 {
//            return
//        }
//        sync(contacts: state, success: { toDelete in
//            success(models, toDelete)
//        }, failure)
//    }
//
//    func contactsLocal(state: ContactStateType,
//                            success: @escaping ([ContactModel]) -> Void,
//                            failure: @escaping (String) -> Void) {
//                  let entitites = self.database.contacts(state: state.rawValue)
//                  let models = ContactModel.toModels(entities: entitites)
//                  success(models)
//    }
//
//    func contacts(nickname: String,
//                  state: ContactStateType,
//                  success: @escaping ([ContactModel]) -> Void,
//                  failure: @escaping (String) -> Void) {
//
//        let entitites = self.database.contacts(nickname: nickname, state: state.rawValue)
//        let models = ContactModel.toModels(entities: entitites)
//        success(models)
//    }
//
//    func subtracting(contacts: [ContactModel],
//                     success: ([ContactModel]) -> Void) {
//        let entitites = self.database.contacts(state: ContactStateType.active.rawValue)
//        let auxMyContacts = ContactModel.toModels(entities: entitites)
//
//        let localIds = auxMyContacts.map { $0.id }
//        let webIds = contacts.map { $0.id }
//
//        var localIdsSet = Set(localIds)
//        let webIdsSet = Set(webIds)
//
//        localIdsSet.subtract(webIdsSet)
//        //TODO: Aqui debemos tener presente que al borrar un contacto se debe borrar todas las conversaciones que se tienen con ese contacto
//        if auxMyContacts.count > .zero {
//            let toDelete = localIdsSet.map {
//                database.contact(by: $0)
//            }
//            success(ContactModel.toModels(entities: toDelete))
//        }
//        self.save(contacts: contacts)
//        success([])
//    }
//
//    func get(by id: Int64) -> ContactModel {
//        let contact = database.contact(by: id)
//        return ContactModel.toModel(entity: contact)
//    }
//
//    func save(contacts: [ContactModel]) {
//        let entities = ContactModel.toEntities(models: contacts)
//        for entity in entities {
//            if database.exist(contact: entity) {
//                database.update(contact: entity)
//            } else {
//                entity.nicknameFake = entity.nickname
//                entity.nameFake = entity.name
//                database.save(contact: entity)
//            }
//        }
//    }
//
//    func save(contact: ContactModel) {
//        let entity = ContactModel.toCustomEntity(model: contact)
//        database.updateCustom(contact: entity)
//    }
//
//    func getAvatar(url: String,
//                   success: @escaping (Data) -> Void) {
//        manager.getAvatar(by: url,
//                          completion: success)
//    }
//
//    func updateAvatar(url: String,
//                      success: @escaping (Data) -> Void) {
//        manager.getAvatar(by: url,
//                          completion: success)
//    }
//
//    func searchUser(nickname: String,
//                    success: @escaping ([ContactModel]) -> Void,
//                    failure: @escaping (String) -> Void) {
//        manager.seachUser(by: nickname) { dtos, error in
//            if error != nil {
//                failure(error!.error)
//                return
//            }
//            var contacts: [ContactModel] = []
//            for dto in dtos {
//                let contact = ContactModel.toModel(dto: dto, state: .active)
//                contacts.append(contact)
//            }
//            success(contacts)
//        }
//    }
//
//    func save(by attachmentId: Int64,
//              base64: String) {
//        guard let data = Data(base64Encoded: base64) else {
//            return
//        }
//        guard let directory = try? fileManager.url(for: .documentDirectory,
//                                                   in: .userDomainMask,
//                                                   appropriateFor: URL(string: contactPathContact),
//                                                   create: false) as NSURL else {
//                                                    return
//        }
//        do {
//            let path: String = String(format: contactName, String(attachmentId))
//            try data.write(to: directory.appendingPathComponent(path)!)
//
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    // the avatar downloaded from the server is replaced
//    func get(path id: Int64) -> String {
//        if let directory = try? fileManager.url(for: .documentDirectory,
//                                                in: .userDomainMask,
//                                                appropriateFor: URL(string: contactPathContact),
//                                                create: false) {
//            let path: String = String(format: contactName, String(id))
//            let url = URL(fileURLWithPath: directory.absoluteString).appendingPathComponent(path)
//            return url.path
//        }
//        return ""
//    }
//
//
//
//    func getContact(by contactId: Int64) -> ContactModel {
//        let contact = database.contact(by: contactId)
//        return ContactModel.toModel(entity: contact)
//    }
//
//    func delete(by id: Int64) {
//        database.delete(id: id)
//    }
//
//    func delete(contact: ContactModel,
//                success: @escaping (Bool) -> Void,
//                failure: @escaping (String) -> Void) {
//        manager.delete(by: contact.id,
//                       socketId:  String.empty) { response, error in
//            DispatchSyncMainThreadSafe {
//                if error != nil {
//                    failure(error!.error)
//                    return
//                }
//                guard let response = response else {
//                    return
//                }
//                success(response.success)
//            }
//        }
//    }
//
//
//
//    func update(contactId: Int64,
//                selfDestructionAt: Int) {
//        database.update(by: contactId,
//                        selfDestructionAt: selfDestructionAt)
//    }
//
//    func isSilenceContact(contact: ContactModel,
//                          success: @escaping (Bool) -> Void,
//                          failure: @escaping (String) -> Void) {
//        manager.isSilenceContact(userId: contact.id) { response, error in
//            DispatchSyncMainThreadSafe {
//                if error != nil {
//                    failure(error!.error)
//                    return
//                }
//                guard let response = response else {
//                    return
//                }
//                success(response.success)
//            }
//        }
//    }
//
//    func silenceContact(contact: ContactModel,
//                        time: TimeSilenceModel,
//                        success: @escaping (Bool) -> Void,
//                        failure: @escaping (String) -> Void) {
//        let request = time.toDTO(model: time)
//        manager.silenceContact(by: request,
//                               userId: contact.id) { response, error in
//                                DispatchSyncMainThreadSafe {
//                                    if error != nil {
//                                        failure(error!.error)
//                                        return
//                                    }
//                                    guard let response = response else {
//                                        return
//                                    }
//                                    let silence = contact.silence ? false : true
//                                    self.database.update(by: contact.id, silence: silence)
//                                    success(response.success)
//                                }
//        }
//    }
//
    func dispose(with id: AnyHashable) {
        database.dispose(by: id)
    }
}
