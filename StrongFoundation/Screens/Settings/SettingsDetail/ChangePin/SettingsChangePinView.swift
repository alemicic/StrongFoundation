//
//  ChangePinView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import SwiftUI
import Combine

struct SettingsChangePinView: View {
    @StateObject var vm: SettingsChangePinVM
    
    var body: some View {
        VStack(spacing: 8) {
            Text("PIN code must be 4 digit number.")
                .font(.textMedium20)
            CustomSecureField(titleKey: "Old PIN", value: $vm.oldPin)
                .modifier(TextPinModifier())
                .onChange(of: vm.oldPin) { _ in
                    vm.limitText($vm.oldPin)
                }
            CustomSecureField(titleKey: "Old PIN", value: $vm.newPin)
                .modifier(TextPinModifier())
                .onChange(of: vm.newPin) { _ in
                    vm.limitText($vm.newPin)
                }
            CustomSecureField(titleKey: "Reenter new PIN", value: $vm.reenterNewPin)
                .modifier(TextPinModifier())
                .onChange(of: vm.reenterNewPin) { _ in
                    vm.limitText($vm.reenterNewPin)
                }
            Button("OK") {}
            Spacer()
        }
        .padding(.horizontal16)
    }
}

#Preview {
    SettingsChangePinView(vm: SettingsChangePinVM())
}
