//
//  Font+Extensions.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import Foundation
import SwiftUI

extension Font {
    //MARK: Bold
    static var titleBold20: Font {
        .system(size: 20, weight: .bold)
    }
    //MARK: Semibold
    static var titleSemibold20: Font {
        .system(size: 20, weight: .semibold)
    }
    //MARK: Medium
    static var textMedium20: Font {
        .system(size: 20, weight: .medium)
    }
    //MARK: Regular
    static var textRegular20: Font {
        .system(size: 20, weight: .regular)
    }
    
    //MARK: Light
    static var textLight20: Font {
        .system(size: 20, weight: .light)
    }
    
    static var textLight16: Font {
        .system(size: 16, weight: .light)
    }
    
    static var textSemibold20: Font {
        Font.custom("RoboFont", size: 20)
            .weight(.semibold)
    }
    
}

//MARK: Font Extension
extension Font {
    enum RobotoFont {
        case semibold
        case custom(String)
        
        var value: String {
            switch self {
                case .semibold:
                    return "Semibold"
                    
                case .custom(let name):
                    return name
            }
        }
    }
    
    enum ManropeFont {
        case semibold
        case custom(String)
        
        var value: String {
            switch self {
                case .semibold:
                    return "Semibold"
                    
                case .custom(let name):
                    return name
            }
        }
    }
    
    static func manrope(_ type: ManropeFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func roboto(_ type: RobotoFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
}
