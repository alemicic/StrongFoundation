//
//  SettingsChangePinVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation
import SwiftUI

class SettingsChangePinVM: SettingsDetailVM, ObservableObject, Navigable {
    var type: SettingsDetailType = .changePin
    var pinLimit: Int = 4
    @Published var oldPin: String = ""
    @Published var newPin: String = ""
    @Published var reenterNewPin: String = ""
    
    func changePin() {
        // MARK: TODO set user defaults
        // retrieve old pin
        //oldPin == oldPin from UD ?
        if newPin == reenterNewPin {
            // set newPin in UD
        }
    }
    
    func limitText(_ value: Binding<String>, limit: Int = 4) {
        if value.wrappedValue.count >= limit {
            value.wrappedValue = String(value.wrappedValue.prefix(limit))
        }
    }
    
}
