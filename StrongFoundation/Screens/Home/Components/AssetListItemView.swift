//
//  AssetListItemView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import SwiftUI

struct AssetListItemView: View {
    private let title: String
    private let description: String
    private let image: String
    
    init(title: String, description: String, image: String) {
        self.title = title
        self.description = description
        self.image = image
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
                .border(Color.blue, width: 1)
            TitleDescriptionView(title: title,
                                 description: description)
            .border(Color.red, width: 1)
            Spacer(minLength: 0)
        }
        .border(.green, width: 1)
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    AssetListItemView(title: "TITLE lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum", description: "DESCR lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum  " , image: "lotr64")
}
