//
//  CustomSecureField.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 23.3.24..
//

import Foundation
import SwiftUI

struct CustomSecureField: View {
    let titleKey: String
    @Binding var value: String
    @State private var isSecured: Bool = true
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    if isSecured {
                        SecureField(titleKey, text: $value)
                            .focused($isFocused)
                    } else {
                        TextField(titleKey, text: $value)
                            .focused($isFocused)
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                    Spacer()
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(isFocused ? .blue : .gray)
            }
        }
    }
}
struct qwe {
    @State static var text: String = "some text"
}
#Preview {
    
    CustomSecureField(titleKey: "Enter password", value: qwe.$text)
}
