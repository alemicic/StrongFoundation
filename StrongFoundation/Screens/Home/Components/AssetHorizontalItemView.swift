//
//  AssetHorizontalItemView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 26.11.23..
//

import SwiftUI

struct AssetHorizontalItemView: View {
    let title: String
    let image: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFit()
                .border(Color.blue, width: 1)
                .frame(width: 60, height: 60)
            Spacer()
            Text(title)
                .border(Color.red, width: 1)
                .lineLimit(1)
        }
        .frame(width: 60, height: 90)
    }
}

#Preview {
    AssetHorizontalItemView(title: "lorem ipsum", image: "lotr64")
}
