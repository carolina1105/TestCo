//
//  DefaultsConfig.swift
//  NapoleoN
//
//  Created by Napoleon Systems S.A.S on 21/11/19.
//  Copyright © 2019 Daniel Cano Arbelaez. All rights reserved.
//

import Foundation

class DefaultsConfig {
    
    static let shared = DefaultsConfig()
    
    let keyisAlertLogout                : String = "keyisAlertLogout"
    
    let keyBackgrounState               : String = "BackgrounState"
    
    let keyAuthProcess                  : String = "AuthProcess"
    let keyLandingProcess               : String = "LandingProcess"
    
    let keyFirebaseId                   : String = "FirebaseId"
    let keyDeviceToken                  : String = "DeviceToken"
    
    let keyRecoveryAttempts             : String = "RecoveryAttempts"
    let keyBlockedRecoveryAttempts      : String = "BlockedRecoveryAttempts"
    
    let keyTheme                        : String = "Theme"
    let keyThemeType                    : String = "ThemeType"
    let keyLanguage                     : String = "NapoleonLanguage"
    
    let keyisPin                        : String = "isPin"
    let keyPinBlockTime                 : String = "PinBlockTime"   // time in which the application will be blocked
    let keyPinUnlockTime                : String = "PinUnlockTime"  // time in which the application is blocked
    let keyPinAttempts                  : String = "PinAttempts"    // failed attempts
    let keyPinIndexBlocking             : String = "PinIndexBlocking"
    let keyPinBlocking                  : String = "PinBlocking"
    
    // SecuritySettings
    let KeyPinLockedTime                : String = "PinLockedTime"  // configuration lockout time
    let KeyPinLockedTimeNoSent          : String = "PinLockedTimeNoSent"  // configuration lockout time
    let keyIsLocalAuth                  : String = "IsLocalAuth"
    let keyDestructionTime              : String = "DestructionTime"
    let keyDestructionTimeNoSent        : String = "DestructionTimeNoSent"
    let keyDownloadAttachments          : String = "DownloadAttachments"

    let KeyBloquedDate                  : String = "BloquedDate"  // Date the app was locked
    let KeyUnlockedDate                 : String = "UnlockedDate"  // Date the app is unlocked
    let KeyIsBloqued                    : String = "IsBloqued"  // Check if it is locked
    let KeyBlockedTime                  : String = "BlockedTime"  // The timer time when the app was locked
    
    let KeyBlockedDateGenerateCode      : String = "BlockedDateGenerateCode"  // Date the app was locked for Generate Code
    let KeyBlockedDateGenerateCodeBack  : String = "BlockedDateGenerateCodeBack"  // Date the app was locked for Generate Code in Backgorund
    let KeyUnlockedDateGenerateCode     : String = "UnlockedDateGenerateCode"  // Date the app is unlocked for Generate Code
    let KeyBlockingAttemptsGenerateCode : String = "BlockingAttemptsGenerateCode"  // Number of failed attempts
    let KeyIsBloquedGenerateCode        : String = "IsBloquedGenerateCode"  // Check if it is lockedCheck if it is locked for Generate Code
    let KeyBlockedTimeGenerateCode      : String = "BlockedTimeGenerateCode"  // The timer time when the app was locked for Geberate Code

    let KeyIsBackground                 : String = "IsBackground"
    let KeyIsViewRegisterCode           : String = "IsViewRegisterCode"
    let KeyNewTime                      : String = "NewTime"
    let keyCurrentConversation          : String = "CurrentConversation"
    let keyIsViewInbox                  : String = "IsViewInbox"
    let keyIsViewConversation           : String = "IsViewConversation"
    let keyIsThirdView                  : String = "IsThirdView"
    let keyLastConversation             : String = "LastConversation"
    let keyLastRow                      : String = "LastRow"
    let keyLastSection                  : String = "LastSection"

    // SecuritySettings
    let KeySubscriptionTime             : String = "SubscriptionTime"
    let KeySubscriptionExpires          : String = "SubscriptionExpires"
    let KeyDestructionTime              : String = "DestructionTime"
    let KeyDisplayNameKey               : String = "DisplayName"

    let KeyIsViewPinCode                : String = "IsViewPinCode"
    let KeyAttackerID                   : String = "AttackerID"
    let KeyIsViewBlockedBackground      : String = "IsViewBlockedBackground"
    
    // Call
    let KeyIsCurrentCall                : String = "IsCurrentCall"
    let KeyIsFromBackgroundCall         : String = "IsFromBackgroundCall"
    
    // Appearance
    let KeyTimeFormat                   : String = "TimeFormat"
    
    // Conversation
    let KeyIsRecorgingAudio             : String = "IsRecorgingAudio"
    
    // Show Case
    let KeyStepShowCase                 : String = "StepShowCase"
    let KeyConversationStepShowCase     : String = "ConversationStepShowCase"
    
    let defaults = UserDefaults(suiteName: "group.com.naposystems.napoleonchat.group")!
    
    func set(value: Any, for key: String) {
        defaults.set(value, forKey: key)
    }
    
    func get(for key: String) -> Any? {
        defaults.value(forKey: key)
    }
    
    func delete(for key: String) -> Any? {
        defaults.removeObject(forKey: key)
    }
    
    func removeAll() {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
