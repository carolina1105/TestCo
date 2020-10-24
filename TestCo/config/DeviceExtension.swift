//
//  Device+Extension.swift
//  NapoleoN
//
//  Created by Napoleon Systems S.A.S on 3/12/19.
//  Copyright © 2019 Daniel Cano Arbelaez. All rights reserved.
//

import UIKit
import AVFoundation

public extension UIDevice {
    private static let standarScale: CGFloat = 2.0
    
    var hasNotch: Bool {
        let initialWindow = 0
        let bottom = UIApplication.shared.windows[initialWindow].safeAreaInsets.bottom
        
        return bottom > 0
    }
    
    var notchSize: CGFloat {
        if UIApplication.shared.windows.count == .zero {
            return .zero
        }
        let initialWindow = 0
        let bottom = UIApplication.shared.windows[initialWindow].safeAreaInsets.bottom
        return bottom
    }
    
    func hasNotch(by window: UIWindow) -> Bool {
        let bottom = window.safeAreaInsets.bottom
        return bottom > 0
    }
    
    var isZoomed: Bool {
        return (UIScreen.main.nativeScale > UIDevice.standarScale)
    }
    
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
