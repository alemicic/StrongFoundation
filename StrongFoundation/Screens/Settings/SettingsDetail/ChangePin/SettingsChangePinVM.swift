//
//  SettingsChangePinVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation

class SettingsChangePinVM: SettingsDetailVM, ObservableObject, Navigable {
    var type: SettingsDetailType = .changePin
    var oldPin: String = ""
    var newPin: String = ""
    var reenterNewPin: String = ""
    
    func changePin() {
        // MARK: TODO set user defaults
        // retrieve old pin
        //oldPin == oldPin from UD ?
        if newPin == reenterNewPin {
            // set newPin in UD
        }
    }
    
}
