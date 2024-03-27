//
//  LanguageView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 25.3.24..
//

import SwiftUI

struct TitleCheckView: View {
    @State var title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isSelected ? Color(UIColor.systemBlue) : Color.secondary)
        }
        .contentShape(Rectangle())
    }
}

//class cl {
//    static var selected = true
//}

//#Preview {
//    LanguageView(languageName: "English", isSelected: $cl.selected)
//}
