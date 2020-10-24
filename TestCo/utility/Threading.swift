//
//  Threading.swift
//  NapoleoN
//
//  Created by Daniel Cano Arbelaez on 6/06/20.
//  Copyright © 2020 Daniel Cano Arbelaez. All rights reserved.
//

import Foundation

func DispatchMainThreadSafe(_ block: @escaping () -> ()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.async(execute: {
            block()
        })
    }
}

func DispatchSyncMainThreadSafe(_ block: () -> ()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.sync(execute: {
            block()
        })
    }
}
