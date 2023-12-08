//
//  SettingsLanguageVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation

class SettingsLanguageVM: SettingsDetailVM, ObservableObject, Navigable {
    var type: SettingsDetailType = .language
    let languages: [String]
    @Published var selectedLanguage: String
    
    init(languages: [String]) {
        self.languages = languages
        // MARK: TODO read from user defaults
        self.selectedLanguage = languages.first ?? ""
    }
    
    func didTap(langauge: String) {
        self.selectedLanguage = langauge
    }
}
