//
//  SettingsItemView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 1.12.23..
//

import SwiftUI

struct SettingsItemView: View {
    @State var image: String
    @State var title: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    SettingsItemView(image: "person.crop.circle", title: "Account")
}
