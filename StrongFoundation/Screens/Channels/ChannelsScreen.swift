//
//  ChannelsScreen.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 1.12.23..
//

import SwiftUI

struct ChannelsScreen: View {
    @StateObject var vm: ChannelsVM
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(vm.filteredChannels) { _ in
                    ChannelItemView(image: "lotr64")
                }
            }
            .padding(.all)
        }
        .searchable(text: $vm.searchText,
                    prompt: "Search Channels")
    }
}

#Preview {
    ChannelsScreen(vm: ChannelsVM())
}
