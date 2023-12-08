//
//  SettingsVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 1.12.23..
//

import Foundation
import Combine

class SettingsVM: ObservableObject {
    @Published var items: [SettingsItem]
    
    let didComplete = PassthroughSubject<Void, Never>()
    
    init(items: [SettingsItem] = []) {
        self.items = items
        initItems()
    }
    
    func didTapSettingsDetails() {
        didComplete.send(())
    }
    
    func initItems() {
        items.append(SettingsItem(image: "person.crop.circle", title: StringConstants.settingsTitleAccount))
        items.append(SettingsItem(image: "textformat.superscript", title: StringConstants.settingsTitleLanguage))
        items.append(SettingsItem(image: "video.circle", title: StringConstants.settingsTitleVideoQuality))
        items.append(SettingsItem(image: "ellipsis.circle", title: StringConstants.settingsTitleChangePin))
    }
}
