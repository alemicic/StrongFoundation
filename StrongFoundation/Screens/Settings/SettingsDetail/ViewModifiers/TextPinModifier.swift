//
//  TextPinModifier.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 23.3.24..
//

import Foundation
import SwiftUI

struct TextPinModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad)
            .padding(.padding4)
            .clipShape(.rect(cornerRadius: 3))
    }
}
