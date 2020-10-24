//
//  CatsDB.swift
//  TestC
//
//  Created by Laddy Carolina Diaz Lamus on 21/10/20.
//

import RealmSwift
import RxCocoa
import RxRealm
import RxSwift

class BreedDB {
    
    static let shared = BreedDB()
    let byId = "SELF.id == %d"
    let byState = "SELF.state == %@"
    let byNicknameAndState = "SELF.nicknameFake CONTAINS %@ AND SELF.state == %@"
    
    lazy var realm: Realm = {
        return try! Realm()
    }()
    var subscriptions = [AnyHashable: Disposable]()
    var myContacts: Results<BreedEntity>?
    
    func load(with id: AnyHashable,
              didChanges: @escaping (AnyRealmCollection<BreedEntity>, RealmChangeset) -> Void) {
        DispatchSyncMainThreadSafe {
            myContacts = realm.objects(BreedEntity.self).filter(byId, id)
            guard let contacts = self.myContacts else {
                return
            }
            subscriptions[id] = Observable.changeset(from: contacts)
                .subscribe(onNext: { contacts, changes in
                    if let changes = changes {
                        didChanges(contacts, changes)
                    }
            })
        }
    }
    
    func contact(by id: Int64) -> BreedEntity {
        var contact: BreedEntity!
        DispatchSyncMainThreadSafe {
            contact = realm.objects(BreedEntity.self).filter(byId, id).first
        }
        guard contact != nil else {
            return BreedEntity()
        }
        return contact
    }
    
    func contacts() -> [BreedEntity] {
        var contacts: [BreedEntity] = []
        DispatchSyncMainThreadSafe {
            let entitites = realm.objects(BreedEntity.self)
            contacts.append(contentsOf: entitites)
        }
        return contacts
    }
    
    func contacts(nickname: String, state: String) -> [BreedEntity] {
        var contacts: [BreedEntity] = []
        DispatchSyncMainThreadSafe {
            let entitites = realm.objects(BreedEntity.self).filter(byNicknameAndState, nickname, state)
            contacts.append(contentsOf: entitites)
        }
        return contacts
    }
    
    func save(contact: BreedEntity) {
        DispatchSyncMainThreadSafe {
            try! realm.write {
                realm.add(contact)
            }
        }
    }
    
    func save(contacts: [BreedEntity]) {
        DispatchSyncMainThreadSafe {
            try! realm.write {
                realm.add(contacts)
            }
        }
    }
    
    func update(contact: BreedEntity) {
        DispatchSyncMainThreadSafe {
            guard let entity = realm.objects(BreedEntity.self).filter(byId, contact.id).first else {
                return
            }
            try! realm.write {
                entity.name = contact.name
//                entity.avatar = contact.avatar
//                entity.status = contact.status
            }
        }
    }

    func exist(contact: BreedEntity) -> Bool {
        var exist: Bool = true
        DispatchSyncMainThreadSafe {
            if realm.objects(BreedEntity.self).filter(byId, contact.id).first == nil {
                exist = false
            }
        }
        return exist
    }
    
    func delete(contact: BreedEntity) {
        DispatchSyncMainThreadSafe {
            guard let entity = realm.objects(BreedEntity.self).filter(byId, contact.id).first else {
                return
            }
            try! realm.write {
                realm.delete(entity)
            }
        }
    }
    
    func delete(id: Int64) {
        DispatchSyncMainThreadSafe {
            guard let entity = realm.objects(BreedEntity.self).filter(byId, id).first else {
                return
            }
            try! realm.write {
                realm.delete(entity)
            }
        }
    }
    
    func dispose(by id: AnyHashable) {
        subscriptions[id]?.dispose()
    }
}
