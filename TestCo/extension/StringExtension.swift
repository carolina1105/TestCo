//
//  StringExtension.swift
//  NapoleoN
//
//  Created by Napoleon Systems S.A.S on 23/10/19.
//  Copyright © 2019 Napoleon Systems S.A.S. All rights reserved.
//

import Foundation
import LanguagesManager

extension String {
    static let empty = ""
    
    var localized: String {
        return ""
//        return LanguagesManager.sharedInstance().localizedString(forKey: self, value: "")
    }
    
    var localizedLanguageDevice: String {
        return NSLocalizedString(self, comment: "")
    }
    
    // this function is used to get the Localizable.strings when they have extra parameters
    func localizeWith(arguments: CVarArg...) -> String {
        let localizedValue = self.localized
        return String(format: localizedValue, arguments: arguments)
    }
    
    var boolValue: Bool {
        return (self as NSString).boolValue
    }
}

extension String {
    func height(by width: CGFloat,
                font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(by height: CGFloat,
               font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}

extension String {
    func appendingPathComponent(_ string: String) -> String {
        return URL(fileURLWithPath: self).appendingPathComponent(string).path
    }
}

extension String {
    static let sixty: Int64 = 60
    static let thousandSixHundred: Int64 = 3600
    
    public static func duration(_ time: Int64) -> String {
        let seconds: Int64 = time % sixty
        let minutes: Int64 = (time / sixty) % sixty
        let hours: Int64 = time / thousandSixHundred
        
        if hours > .zero {
            return String(format: "%ld:%02ld:%02ld", hours, minutes, seconds)
        } else {
            return String(format: "%ld:%02ld", minutes, seconds)
        }
    }
}

extension String {
    func split(by count: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: count, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        return results.map { String($0) }
    }
    
    func removeExtraPoints() -> String {
        return self.replacingOccurrences(of: "[.]+", with: "", options: .regularExpression, range: nil)
    }
    
    func removeExtraSpaces() -> String {
        return self.replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
    }
    
    func capitalizingFirst() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirst() {
        self = self.capitalizingFirst()
    }
}
