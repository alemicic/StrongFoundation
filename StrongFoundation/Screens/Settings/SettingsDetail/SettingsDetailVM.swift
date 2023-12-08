//
//  SettingsDetailVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation

enum SettingsDetailType {
    case account
    case language
    case videoQuality
    case changePin
    
    var rawValue: String {
        switch self {
            case .account:
                return StringConstants.settingsTitleAccount
            case .language:
                return StringConstants.settingsTitleLanguage
            case .videoQuality:
                return StringConstants.settingsTitleVideoQuality
            case .changePin:
                return StringConstants.settingsTitleChangePin
        }
    }
}

protocol SettingsDetailVM: ObservableObject {
    var type: SettingsDetailType { get }
}
