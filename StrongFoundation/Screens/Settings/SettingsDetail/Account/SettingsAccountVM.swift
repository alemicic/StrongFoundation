//
//  SettingsAccountVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import Foundation

class SettingsAccountVM: SettingsDetailVM, ObservableObject, Navigable {
    var type: SettingsDetailType = .account
    let accountName: String
    
    init(accountName: String) {
        self.accountName = accountName
    }
    
    func logout() {
        print("LOGOUT")
        // MARK: TODO
    }
}
