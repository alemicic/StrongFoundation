//
//  TitleDescriptionView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import SwiftUI

struct TitleDescriptionView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            // TODO: expand text as much as possible
            Text(title)
                .font(.titleSemibold20)
                .lineLimit(2)
            Text(description)
                .font(.textLight16)
                .lineLimit(1)
        }
    }
}

#Preview {
    TitleDescriptionView(title: "Title sdv ds ds v  sv vds dsv sdv sd sdv dvs dv ds sd sd d ssd sd v sdv s vaddsvd dsvdsvsdvsdvsdv", description: "Description 13123 3 1 21 213123123132 12 123 312 13 132 23321 21 2133231 1 3  13 13 13")
}
