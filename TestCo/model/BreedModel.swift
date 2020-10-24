//
//  Breed.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 5/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

//struct Breed: Decodable {
//    var alternativeNames: String?
//    var id: String
//    var name: String
//    var description: String
//    var origin: String
//    var temperament: String
//    var wikipediaURL: String?
//    
//    private enum CodingKeys: CodingKey {
//        case alt_names
//        case id
//        case name
//        case description
//        case origin
//        case temperament
//        case wikipedia_url
//    }
//    



import Foundation

struct BreedModel: Identifiable, Codable, Hashable {
    var alternativeNames: String?
    var id: String
    var name: String
    var description: String
    var origin: String
    var temperament: String
    var wikipediaURL: String?
    
    init(alternativeNames: String? = "",
         id: String = "",
         name: String = "",
         description: String = "",
         origin: String = "",
         temperament: String = "",
         wikipediaURL: String? = "") {
        self.alternativeNames = alternativeNames
        self.id = id
        self.name = name
        self.description = description
        self.origin = origin
        self.temperament = temperament
        self.wikipediaURL = wikipediaURL
    }
    
    static func toModel(dto: BreedResDTO) -> BreedModel {
        let model = BreedModel(alternativeNames: dto.alternativeNames, 
                               id: dto.id, 
                               name: dto.name, 
                               description: dto.description, 
                               origin: dto.origin, 
                               temperament: dto.temperament, 
                               wikipediaURL: dto.wikipediaURL)
        return model
    }
    
    static func toModels(entities: [BreedEntity]) -> [BreedModel] {
        var models: [BreedModel] = []
        DispatchSyncMainThreadSafe {
            models = entities.map {
                toModel(entity: $0)
            }
        }
        return models
    }
//    
//    static func toEntities(models: [ContactModel]) -> [ContactEntity] {
//        return models.map {
//            toEntity(model: $0)
//        }
//    }
//    
//    static func toEntity(model: ContactModel) -> ContactEntity {
//        let entity = ContactEntity()
//        entity.id = model.id
//        entity.nickname = model.nickname
//        entity.name = model.name
//        entity.avatar = model.avatar
//        entity.status = model.status
//        entity.state = model.state.rawValue
//        entity.silence = model.silence
//        entity.selfDestructionAt = model.selfDestructionAt
//        return entity
//    }
//    
//    static func toCustomEntity(model: ContactModel) -> ContactEntity {
//        let entity = ContactEntity()
//        entity.id = model.id
//        entity.nicknameFake = model.nickname
//        entity.nameFake = model.name
//        entity.avatarFake = model.avatar
//        entity.silence = model.silence
//        return entity
//    }
//    
    static func toModel(entity: BreedEntity) -> BreedModel {
        var model: BreedModel!
        DispatchSyncMainThreadSafe {
            model = BreedModel(alternativeNames: entity.alternativeNames, 
                               id: entity.id, 
                               name: entity.name, 
                               description: entity.description, 
                               origin: entity.origin, 
                               temperament: entity.temperament, 
                               wikipediaURL: entity.wikipediaURL)
        }
        guard model != nil else {
            return BreedModel()
        }
        return model
    }
//    
//    static func toModelReset(entity: ContactEntity) -> ContactModel {
//        let model = ContactModel(id: entity.id,
//                                 nickname: entity.nickname,
//                                 name:  entity.name,
//                                 status: entity.status,
//                                 lastseen: 0,
//                                 avatar: entity.avatar,
//                                 state: ContactStateType(rawValue: entity.state)!)
//        return model
//    }
}
