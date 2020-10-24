//
//  KeychainConfig.swift
//  NapoleoN
//
//  Created by Napoleon Systems S.A.S on 6/02/20.
//  Copyright © 2020 Daniel Cano Arbelaez. All rights reserved.
//

import Foundation
import KeychainSwift

class KeychainConfig {
    static let shared = KeychainConfig()
    static let group = "group.com.naposystems.napoleonchat.group"
    
    lazy var keychain: KeychainSwift = {
        return KeychainSwift()
    }()
    
    func set(value: String, for key: String) {
        keychain.accessGroup = KeychainConfig.group
        keychain.set(value, forKey: key, withAccess: .accessibleAfterFirstUnlock)
    }
    
    func get(for key: String) -> String {
        keychain.accessGroup = KeychainConfig.group
        guard let value = keychain.get(key) else {
            return ""
        }
        return value
    }
}
