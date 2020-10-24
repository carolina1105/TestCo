//
//  CatsListWS.swift
//  TestC
//
//  Created by Laddy Carolina Diaz Lamus on 21/10/20.
//

import Foundation

class BreedsListWS {
    
    static let shared = BreedsListWS()
    let endPoints = Constant.default
    
    var manager = ManagerWS.shared
    //https: // docs.thecatapi.com/
//    func breedsList(completion: @escaping ([BreedResDTO], ErrorDTO?) -> Void) {
//        let url = endPoints.serverUrl + endPoints.listBreeds
//        print("url+ = \(url)")
//        manager.make(url: url,
//                     method: .get) { breeds, fail, error in
//            completion(breeds ?? [], fail)
//        }
//    }
    
    func breedsList(page: String? = nil,
                    limit: Int? = nil,
                    completion: @escaping ([BreedResDTO],  BreedsErrorResDTO?, ErrorDTO?) -> Void) {
//        let url = endPoints.serverUrl + endPoints.listBreeds
        
        var auxUrl = endPoints.serverUrl + endPoints.listBreeds
        if let limit = limit {
            auxUrl = auxUrl + "?per_page=\(limit)"
        }
        let url = page ?? auxUrl
        
        
        
        print("url+ = \(url)")
        manager.make(url: url,
                     method: .get) { response, fail, error in
            completion(response ?? [], fail, error)
        }
    }

}

