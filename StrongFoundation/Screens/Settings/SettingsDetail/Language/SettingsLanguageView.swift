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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SettingsLanguageView(vm: SettingsLanguageVM(languages: ["eng"]))
}
