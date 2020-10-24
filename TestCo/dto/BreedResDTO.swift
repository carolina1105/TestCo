//
//  CatsListResDTO.swift
//  TestC
//
//  Created by Laddy Carolina Diaz Lamus on 21/10/20.
//

import Foundation

struct BreedResDTO: Codable {
    var alternativeNames: String?
    var id: String
    var name: String
    var description: String
    var origin: String
    var temperament: String
    var wikipediaURL: String?

    private enum CodingKeys: String, CodingKey {
        case alternativeNames = "alt_names"
        case id
        case name
        case description
        case origin
        case temperament
        case wikipediaURL = "wikipedia_url"
    }
}


struct BreedsErrorResDTO: Codable {
    var error: String?
    var idErrors: [String]?
    var breedErrors: [String]?

    private enum CodingKeys: String, CodingKey {
        case error
        case idErrors
        case breedErrors = "description"
    }
}

extension BreedsErrorResDTO {
    func allValuesBreedsList() throws -> [String] {
        
        var result: [String] = []
        
        let mirror = Mirror(reflecting: self)
        
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            throw NSError()
        }
        
        for (_, value) in mirror.children {
            guard let value = value as? [String] else {
                continue
            }
            result.append(contentsOf: value)
        }
        return result
    }
}
