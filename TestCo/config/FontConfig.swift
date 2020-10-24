//
//  FontConfig.swift
//  NapoleoN
//
//  Created by Napoleon Systems S.A.S on 28/10/19.
//  Copyright © 2019 Napoleon Systems S.A.S. All rights reserved.
//

import UIKit

fileprivate let defRobotoBold    = "Roboto-Bold"
fileprivate let defRobotoItalic  = "Roboto-Italic"
fileprivate let defRobotoBoldItalic = "Roboto-BoldItalic"
fileprivate let defRobotoLight   = "Roboto-Light"
fileprivate let defRobotoMedium  = "Roboto-Medium"
fileprivate let defRobotoRegular = "Roboto-Regular"

fileprivate let defIconBack   = CGFloat(25.0)
fileprivate let defBigTitle   = CGFloat(25.0)
fileprivate let defTitle      = CGFloat(20.0)
fileprivate let defText       = UIDevice.current.isZoomed ? CGFloat(14.5) : CGFloat(17.0)
fileprivate let defMediumText = UIDevice.current.isZoomed ? CGFloat(12.0) : CGFloat(14.0)
fileprivate let defSmallText  = UIDevice.current.isZoomed ? CGFloat(11.0) : CGFloat(12.0)

struct FontConfig {
    let robotoBold:    String
    let robotoItalic:  String
    let robotoBoldItalic: String
    let robotoLight:   String
    let robotoMedium:  String
    let robotoRegular: String
    
    static let `default` = FontConfig(robotoBold: defRobotoBold,
                                      robotoItalic: defRobotoItalic,
                                      robotoBoldItalic: defRobotoBoldItalic,
                                      robotoLight: defRobotoLight,
                                      robotoMedium: defRobotoMedium,
                                      robotoRegular: defRobotoRegular)
}

struct FontSizeConfig {
    let iconBack: CGFloat
    let bigTitle:  CGFloat
    let title: CGFloat
    let text:  CGFloat
    let smallText:  CGFloat
    let mediumText: CGFloat
    
    static let `default` = FontSizeConfig(iconBack: defIconBack,
                                          bigTitle: defBigTitle,
                                          title: defTitle,
                                          text: defText,
                                          smallText: defSmallText,
                                          mediumText: defMediumText)
}
