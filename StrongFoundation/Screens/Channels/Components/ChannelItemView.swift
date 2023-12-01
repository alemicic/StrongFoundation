//
//  ChannelItemView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 1.12.23..
//

import SwiftUI

struct ChannelItemView: View {
    let image: String
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .border(Color.blue, width: 1)
                .padding(.all)
            Spacer()
        }
        .border(Color.gray, width: 1)
//        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    ChannelItemView(image: "lotr64")
}
