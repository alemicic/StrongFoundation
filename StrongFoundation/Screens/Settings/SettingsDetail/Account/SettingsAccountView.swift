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
            .font(.textMedium20)
        Text(StringConstants.settingsAccountDescription)
            .font(.textLight16)
        Button(action: vm.logout) {
            Text(StringConstants.settingsAccountSignout)
        }
        Spacer()
    }
}

#Preview {
    SettingsAccountView(vm: SettingsAccountVM(accountName: "some name"))
}
