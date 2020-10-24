//
//  CatEntitie.swift
//  TestC
//
//  Created by Laddy Carolina Diaz Lamus on 21/10/20.
//

import Foundation
import RealmSwift

class BreedEntity: Object {

    @objc dynamic var alternativeNames: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var descriptioN : String = ""
    @objc dynamic var origin: String = ""
    @objc dynamic var temperament: String = ""
    @objc dynamic var wikipediaURL: String = ""

}
