//
//  SettingsVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 1.12.23..
//

import Foundation
import Combine

class SettingsVM: ObservableObject, Completeable {
    @Published var items: [SettingsItem]
    
    let didComplete = PassthroughSubject<SettingsItem, Never>()
    
    init(items: [SettingsItem] = []) {
        self.items = items
        initItems()
    }
    
    func didTapSettingsDetails(settingsItem: SettingsItem) {
        didComplete.send(settingsItem)
    }
    
    func initItems() {
        items.append(SettingsItem(type: .account, image: "person.crop.circle", title: StringConstants.settingsTitleAccount))
        items.append(SettingsItem(type: .language, image: "textformat.superscript", title: StringConstants.settingsTitleLanguage))
        items.append(SettingsItem(type: .videoQuality, image: "video.circle", title: StringConstants.settingsTitleVideoQuality))
        items.append(SettingsItem(type: .changePin, image: "ellipsis.circle", title: StringConstants.settingsTitleChangePin))
    }
}
