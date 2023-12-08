//
//  SettiingsVideoQualityVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation

class SettingsVideoQualityVM: SettingsDetailVM, ObservableObject, Navigable {
    var type: SettingsDetailType = .videoQuality
    
    @Published var isWifiOn: Bool
    @Published var selectedWifi: String
    @Published var isCellularOn: Bool
    @Published var selectedCellular: String
    
    init(isWifiOn: Bool = true,
         selectedWifi: String = "medium",
         isCellularOn: Bool = true,
         selectedCellular: String = "medium") {
        // MARK: TODO read from user defaults
        self.isWifiOn = isWifiOn
        self.selectedWifi = selectedWifi
        self.isCellularOn = isCellularOn
        self.selectedCellular = selectedCellular
    }
}
