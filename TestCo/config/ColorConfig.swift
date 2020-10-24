//
//  ColorConfig.swift
//  NapoleoN
//
//  Created by Napoleon Systems S.A.S on 28/10/19.
//  Copyright © 2019 Napoleon Systems S.A.S. All rights reserved.
//

import SwiftUI

fileprivate let defBackground       = "Background"
fileprivate let defBackgroundConversation = "BackgroundConversation"
fileprivate let defBackgroundDialog = "BackgroundDialog"
fileprivate let defButton           = "Button"
fileprivate let defTint             = "Tint"
fileprivate let defOutgoing         = "Outgoing"
fileprivate let defPrimary          = "Primary"
fileprivate let defPrimaryDark      = "PrimaryDark"
fileprivate let defPrimaryLight     = "PrimaryLight"
fileprivate let defPrimaryText      = "PrimaryText"
fileprivate let defSecondary        = "Secondary"
fileprivate let defSecondaryDark    = "SecondaryDark"
fileprivate let defSecondaryLight   = "SecondaryLight"
fileprivate let defSecondaryText    = "SecondaryText"
fileprivate let defSystem           = "System"
fileprivate let defThird            = "Third"
fileprivate let defFourth           = "Fourth"
fileprivate let defSection          = "Section"
fileprivate let defIcon             = "Icon"
fileprivate let defIconDark         = "IconDark"
fileprivate let defIconLight        = "IconLight"
fileprivate let defEmptyState       = "EmptyState"

fileprivate let defIncomingMessage  = "IncomingMessage"
fileprivate let defMyMessage        = "MyMessage"
fileprivate let defBackgroundDestruction  = "BackgroundDestruction"
fileprivate let defDestructionText  = "DestructionText"
fileprivate let defHeaderText       = "HeaderText"
fileprivate let defBackgroundQuoteMyMessage = "BackgroundQuoteMyMessage"
fileprivate let defBackgroundQuoteIncomingMessage = "BackgroundQuoteIncomingMessage"
fileprivate let defIdentifierMyQuote = "IdentifierMyQuote"
fileprivate let defIdentifierYourQuote = "IdentifierYourQuote"
fileprivate let defBodyQuoteMyMessage = "BodyQuoteMyMessage"
fileprivate let defBodyQuoteIncomingMessage = "BodyQuoteIncomingMessage"
fileprivate let defTintControl = "TintControl"
fileprivate let defTintControlMyMessage = "TintControlMyMessage"
fileprivate let defProgressBar = "ProgressBar"
fileprivate let defTintIconMedia = "TintIconMedia"
fileprivate let defTintUnPlayed = "TintUnPlayed"
fileprivate let defStatusBorder = "StatusBorder"

class ColorConfig {
    private static var sharedInstance: ColorConfig?
    
    var background:       Color
    var backgroundConversation: Color
    var backgroundDialog: Color
    var button:           Color
    var tint:             Color
    var outgoing:         Color
    var primary:          Color
    var primaryDark:      Color
    var primaryLight:     Color
    var primaryText:      Color
    var secondary:        Color
    var secondaryDark:    Color
    var secondaryLight:   Color
    var secondaryText:    Color
    var system:           Color
    var third:            Color
    var fourth:           Color
    var section:          Color
    var icon:             Color
    var iconDark:         Color
    var iconLight:        Color
    var emptyState:       Color
    var incomingMessage:  Color
    var myMessage:        Color
    var backgroundDestruction: Color
    var destructionText:  Color
    var headerText:       Color
    var backgroundQuoteMyMessage: Color
    var backgroundQuoteIncomingMessage: Color
    var identifierMyQuote:   Color
    var identifierYourQuote: Color
    var bodyQuoteMyMessage:  Color
    var bodyQuoteIncomingMessage: Color
    var tintControl:      Color
    var progressBar:      Color
    var tintIconMedia:    Color
    var tintControlMyMessage: Color
    var tintUnPlayed:     Color
    var statusBorder:     Color

    init() {
        self.background       = Color(defBackground + AppTheme.getTheme())
        self.backgroundConversation = Color(defBackgroundConversation + AppTheme.getTheme())
        self.backgroundDialog = Color(defBackgroundDialog + AppTheme.getTheme())
        self.button           = Color(defButton + AppTheme.getTheme())
        self.tint             = Color(defTint + AppTheme.getTheme())
        self.outgoing         = Color(defOutgoing  + AppTheme.getTheme())
        self.primary          = Color(defPrimary  + AppTheme.getTheme())
        self.primaryDark      = Color(defPrimaryDark + AppTheme.getTheme())
        self.primaryLight     = Color(defPrimaryLight + AppTheme.getTheme())
        self.primaryText      = Color(defPrimaryText + AppTheme.getTheme())
        self.secondary        = Color(defSecondary + AppTheme.getTheme())
        self.secondaryDark    = Color(defSecondaryDark + AppTheme.getTheme())
        self.secondaryLight   = Color(defSecondaryLight + AppTheme.getTheme())
        self.secondaryText    = Color(defSecondaryText + AppTheme.getTheme())
        self.system           = Color(defSystem + AppTheme.getTheme())
        self.third            = Color(defThird + AppTheme.getTheme())
        self.fourth           = Color(defFourth + AppTheme.getTheme())
        self.section          = Color(defSection + AppTheme.getTheme())
        self.icon             = Color(defIcon + AppTheme.getTheme())
        self.iconDark         = Color(defIconDark + AppTheme.getTheme())
        self.iconLight        = Color(defIconLight + AppTheme.getTheme())
        self.emptyState       = Color(defEmptyState + AppTheme.getTheme())
        self.incomingMessage  = Color(defIncomingMessage + AppTheme.getTheme())
        self.myMessage        = Color(defMyMessage + AppTheme.getTheme())
        self.backgroundDestruction = Color(defBackgroundDestruction + AppTheme.getTheme())
        self.destructionText = Color(defDestructionText + AppTheme.getTheme())
        self.headerText       = Color(defHeaderText + AppTheme.getTheme())
        self.backgroundQuoteMyMessage = Color(defBackgroundQuoteMyMessage + AppTheme.getTheme())
        self.backgroundQuoteIncomingMessage = Color(defBackgroundQuoteIncomingMessage + AppTheme.getTheme())
        self.identifierMyQuote = Color(defIdentifierMyQuote + AppTheme.getTheme())
        self.identifierYourQuote = Color(defIdentifierYourQuote + AppTheme.getTheme())
        self.bodyQuoteMyMessage = Color(defBodyQuoteMyMessage + AppTheme.getTheme())
        self.bodyQuoteIncomingMessage = Color(defBodyQuoteIncomingMessage + AppTheme.getTheme())
        self.tintControl = Color(defTintControl + AppTheme.getTheme())
        self.progressBar = Color(defProgressBar + AppTheme.getTheme())
        self.tintIconMedia = Color(defTintIconMedia + AppTheme.getTheme())
        self.tintControlMyMessage = Color(defTintControlMyMessage + AppTheme.getTheme())
        self.tintUnPlayed = Color(defTintUnPlayed + AppTheme.getTheme())
        self.statusBorder = Color(defStatusBorder + AppTheme.getTheme())


    }
    
    class var shared: ColorConfig {
        guard let shared = self.sharedInstance else {
            let sharedInstance = ColorConfig()
            self.sharedInstance = sharedInstance
            return sharedInstance
        }
        return shared
    }
    
    class func destroy() {
        sharedInstance = nil
    }
}

class UIColorConfig {
    private static var sharedInstance: UIColorConfig?
    
    var background:       UIColor
    var backgroundConversation: UIColor
    var backgroundDialog: UIColor
    var button:           UIColor
    var tint:             UIColor
    var outgoing:         UIColor
    var primary:          UIColor
    var primaryDark:      UIColor
    var primaryLight:     UIColor
    var primaryText:      UIColor
    var secondary:        UIColor
    var secondaryDark:    UIColor
    var secondaryLight:   UIColor
    var secondaryText:    UIColor
    var system:           UIColor
    var third:            UIColor
    var fourth:           UIColor
    var section:          UIColor
    var icon:             UIColor
    var iconDark:         UIColor
    var iconLight:        UIColor
    var emptyState:       UIColor
    var incomingMessage:  UIColor
    var myMessage:        UIColor
    var backgroundDestruction: UIColor
    var destructionText:  UIColor
    var headerText:       UIColor
    var backgroundQuoteMyMessage: UIColor
    var backgroundQuoteIncomingMessage: UIColor
    var identifierMyQuote:   UIColor
    var identifierYourQuote: UIColor
    var bodyQuoteMyMessage:  UIColor
    var bodyQuoteIncomingMessage: UIColor
    var tintControl:      UIColor
    var progressBar:      UIColor
    var tintIconMedia:    UIColor
    var tintControlMyMessage: UIColor
    var tintUnPlayed:     UIColor
    var statusBorder:     UIColor

    init() {
        self.background       = UIColor(named: defBackground + AppTheme.getTheme())!
        self.backgroundConversation = UIColor(named: defBackgroundConversation + AppTheme.getTheme())!
        self.backgroundDialog = UIColor(named: defBackgroundDialog + AppTheme.getTheme())!
        self.button           = UIColor(named: defButton + AppTheme.getTheme())!
        self.tint             = UIColor(named: defTint + AppTheme.getTheme())!
        self.outgoing         = UIColor(named: defOutgoing  + AppTheme.getTheme())!
        self.primary          = UIColor(named: defPrimary  + AppTheme.getTheme())!
        self.primaryDark      = UIColor(named: defPrimaryDark + AppTheme.getTheme())!
        self.primaryLight     = UIColor(named: defPrimaryLight + AppTheme.getTheme())!
        self.primaryText      = UIColor(named: defPrimaryText + AppTheme.getTheme())!
        self.secondary        = UIColor(named: defSecondary + AppTheme.getTheme())!
        self.secondaryDark    = UIColor(named: defSecondaryDark + AppTheme.getTheme())!
        self.secondaryLight   = UIColor(named: defSecondaryLight + AppTheme.getTheme())!
        self.secondaryText    = UIColor(named: defSecondaryText + AppTheme.getTheme())!
        self.system           = UIColor(named: defSystem + AppTheme.getTheme())!
        self.third            = UIColor(named: defThird + AppTheme.getTheme())!
        self.fourth           = UIColor(named: defFourth + AppTheme.getTheme())!
        self.section          = UIColor(named: defSection + AppTheme.getTheme())!
        self.icon             = UIColor(named: defIcon + AppTheme.getTheme())!
        self.iconDark         = UIColor(named: defIconDark + AppTheme.getTheme())!
        self.iconLight        = UIColor(named: defIconLight + AppTheme.getTheme())!
        self.emptyState       = UIColor(named: defEmptyState + AppTheme.getTheme())!
        self.incomingMessage  = UIColor(named: defIncomingMessage + AppTheme.getTheme())!
        self.myMessage        = UIColor(named: defMyMessage + AppTheme.getTheme())!
        self.backgroundDestruction = UIColor(named: defBackgroundDestruction + AppTheme.getTheme())!
        self.destructionText  = UIColor(named: defDestructionText + AppTheme.getTheme())!
        self.headerText       = UIColor(named: defHeaderText + AppTheme.getTheme())!
        self.backgroundQuoteMyMessage = UIColor(named: defBackgroundQuoteMyMessage + AppTheme.getTheme())!
        self.backgroundQuoteIncomingMessage = UIColor(named: defBackgroundQuoteIncomingMessage + AppTheme.getTheme())!
        self.identifierMyQuote = UIColor(named: defIdentifierMyQuote + AppTheme.getTheme())!
        self.identifierYourQuote = UIColor(named: defIdentifierYourQuote + AppTheme.getTheme())!
        self.bodyQuoteMyMessage = UIColor(named: defBodyQuoteMyMessage + AppTheme.getTheme())!
        self.bodyQuoteIncomingMessage = UIColor(named: defBodyQuoteIncomingMessage + AppTheme.getTheme())!
        self.tintControl = UIColor(named: defTintControl + AppTheme.getTheme())!
        self.progressBar = UIColor(named: defProgressBar + AppTheme.getTheme())!
        self.tintIconMedia = UIColor(named: defTintIconMedia + AppTheme.getTheme())!
        self.tintControlMyMessage = UIColor(named: defTintControlMyMessage + AppTheme.getTheme())!
        self.tintUnPlayed = UIColor(named: defTintUnPlayed + AppTheme.getTheme())!
        self.statusBorder = UIColor(named: defStatusBorder + AppTheme.getTheme())!

    }
    
    class var shared: UIColorConfig {
        guard let shared = self.sharedInstance else {
            let sharedInstance = UIColorConfig()
            self.sharedInstance = sharedInstance
            return sharedInstance
        }
        return shared
    }
    
    class func destroy() {
        sharedInstance = nil
    }
}

enum ThemeAppType: String {
    case systemOne = "1"
    case systemTwo = "2"
    case darkOne = "3"
    case darkTwo = "6"
    case darkThree = "7"
    case lightOne = "4"
    case lightTwo = "5"
    case LightThree = "8"
}

struct AppTheme {
    
    private static let theme = "Theme"
    private static let deftheme = "1"
    
    static func getTheme() -> String {
        let defaults = DefaultsConfig.shared
        let theme = defaults.get(for: AppTheme.theme) as? String ?? AppTheme.deftheme
        return "-" + theme
    }
    
}
