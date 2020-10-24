//
//  ErrorUtility.swift
//  NapoleoN
//
//  Created by Napoleon Systems S.A.S on 2/12/19.
//  Copyright © 2019 Daniel Cano Arbelaez. All rights reserved.
//

import Foundation

class ErrorUtility {
    
    static let shared = ErrorUtility()
    
    func getMessage(by list: [String]) -> String {
        var message: String = ""
        for propery in list {
            message = message + propery + "\n"
        }
        return message
    }
    
}
