//
//  SettiingsVideoQualityVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation

enum Quality: String {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

class SettingsVideoQualityVM: SettingsDetailVM, ObservableObject, Navigable {
    var type: SettingsDetailType = .videoQuality
    
    @Published var isWifiOn: Bool
    @Published var isHighWifiOn: Bool = false
    @Published var isMediumWifiOn: Bool = false
    @Published var isLowWifiOn: Bool = false
    
    @Published var selectedWifi: Quality
    
    @Published var isCellularOn: Bool
    @Published var isHighCellularOn: Bool = false
    @Published var isMediumCellularOn: Bool = false
    @Published var isLowCellularOn: Bool = false
    
    @Published var selectedCellular: Quality
    
    init(isWifiOn: Bool = false,
         selectedWifi: Quality = .medium,
         isCellularOn: Bool = true,
         selectedCellular: Quality = .medium) {
        // MARK: TODO read from user defaults
        self.isWifiOn = isWifiOn
        self.selectedWifi = selectedWifi
        self.isCellularOn = isCellularOn
        self.selectedCellular = selectedCellular
        initialSelection()
    }
    
    func initialSelection() {
        switch selectedWifi {
            case .high:
                isHighWifiOn = true
            case .medium:
                isMediumWifiOn = true
            case .low:
                isLowWifiOn = true
        }
        switch selectedCellular {
            case .high:
                isHighCellularOn = true
            case .medium:
                isMediumCellularOn = true
            case .low:
                isLowCellularOn = true
        }
    }
    
    func selectWifi() {
        
    }
}
