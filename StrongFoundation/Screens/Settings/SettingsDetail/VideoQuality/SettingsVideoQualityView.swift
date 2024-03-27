//
//  SettingsVideoQualityView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import SwiftUI

struct SettingsVideoQualityView: View {
    @StateObject var vm: SettingsVideoQualityVM
    
    var body: some View {
        VStack {
            Toggle("Wifi Quality", isOn: $vm.isWifiOn)
            Group {
                TitleCheckView(title: "High", isSelected: $vm.isHighWifiOn)
                    .onTapGesture {
                        vm.isHighWifiOn.toggle()
                        vm.selectedWifi = .high
                    }
                TitleCheckView(title: "Medium", isSelected: $vm.isMediumWifiOn)
                    .onTapGesture {
                        vm.isHighWifiOn.toggle()
                        vm.selectedWifi = .high
                    }
                TitleCheckView(title: "Low", isSelected: $vm.isLowWifiOn)
                    .onTapGesture {
                        vm.isHighWifiOn.toggle()
                        vm.selectedWifi = .high
                    }
            }
            .disabled(vm.isCellularOn)
            Toggle("Cellular Quality", isOn: $vm.isCellularOn)
            Group {
                TitleCheckView(title: "High", isSelected: $vm.isHighCellularOn)
                TitleCheckView(title: "Medium", isSelected: $vm.isMediumCellularOn)
                TitleCheckView(title: "Low", isSelected: $vm.isMediumCellularOn)
            }
            .disabled(vm.isCellularOn)
        }
        .padding(.horizontal16)
    }
}

#Preview {
    SettingsVideoQualityView(vm: SettingsVideoQualityVM())
}
