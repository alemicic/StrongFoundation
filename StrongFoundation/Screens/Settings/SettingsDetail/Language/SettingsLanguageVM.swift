//
//  SettingsLanguageVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation

struct LanguageModel: Identifiable {
    let id = UUID()
    var name: String
    var isSelected: Bool
}

class SettingsLanguageVM: SettingsDetailVM, ObservableObject, Navigable {
    var type: SettingsDetailType = .language
    @Published var languages: [LanguageModel]
    @Published var selectedLanguageIndex: Int
    
    init(languages: [LanguageModel]) {
        self.languages = languages
        // MARK: TODO read from user defaults
        self.selectedLanguageIndex = languages.firstIndex {
            $0.isSelected
        } ?? 0
    }
    
    func didTap(index: Int) {
        guard selectedLanguageIndex != index else { return }
            
        languages[selectedLanguageIndex].isSelected.toggle()
        languages[index].isSelected.toggle()
        selectedLanguageIndex = index
    }
}
