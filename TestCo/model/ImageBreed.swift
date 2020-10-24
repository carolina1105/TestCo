//
//  ImageBreed.swift
//  TechnicalTestCondorLabs
//
//  Created by Andrés Carrillo on 6/09/20.
//  Copyright © 2020 Andrés Carrillo. All rights reserved.
//

import Foundation

struct ImageBreed: Decodable {
    var id: String
    var url: String
    
    private enum CodingKeys: CodingKey {
        case id
        case url
    }
    
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.id         = try container.decode(String.self, forKey: .id)
        self.url        = try container.decode(String.self, forKey: .url)
    }
    
}
