//
//  SettingsLanguageView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 7.12.23..
//

import SwiftUI

struct SettingsLanguageView: View {
    @StateObject var vm: SettingsLanguageVM
    
    var body: some View {
        ScrollView {
            Divider()
            ForEach(vm.languages.indices) { id in
                TitleCheckView(title: vm.languages[id].name, isSelected: $vm.languages[id].isSelected)
                    .padding(.horizontal16)
                    .onTapGesture {
                        vm.didTap(index: id)
                    }
                Divider()
            }
        }
    }
}

let list = [
    LanguageModel(name: "English", isSelected: false),
    LanguageModel(name: "Serbian", isSelected: true),
    LanguageModel(name: "Hungarian", isSelected: false),
    LanguageModel(name: "Romanian", isSelected: false)
]

#Preview {
    SettingsLanguageView(vm: SettingsLanguageVM(languages: list))
}
