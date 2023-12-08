//
//  SettingsAccountView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import SwiftUI

struct SettingsAccountView: View {
    @StateObject var vm: SettingsAccountVM
    
    var body: some View {
        Text(vm.accountName)
        Text(StringConstants.settingsAccountDescription)
        Button(action: vm.logout) {
            Text(StringConstants.settingsAccountSignout)
        }
    }
}

#Preview {
    SettingsAccountView(vm: SettingsAccountVM(accountName: "some name"))
}
