//
//  SettingsScreen.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 1.12.23..
//

import SwiftUI

struct SettingsScreen: View {
    @StateObject var vm: SettingsVM
    
    var body: some View {
        List(vm.items, id: \.title) { item in
            SettingsItemView(image: item.image, title: item.title)
                .listRowInsets(.padding0)
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in return 0 }
                .onTapGesture {
                    vm.didTapSettingsDetails(settingsItem: item)
                }
        }
        .listStyle(.plain)
        .padding(.horizontal16)
        
    }
}

#Preview {
    SettingsScreen(vm: SettingsVM())
}
