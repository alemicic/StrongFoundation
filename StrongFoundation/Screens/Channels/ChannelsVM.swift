//
//  ChannelsVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 1.12.23..
//

import Foundation
import Combine

class ChannelsVM: ObservableObject {
    @Published var searchText: String
    @Published var channels: [ChannelModel] = []
    
    var filteredChannels: [ChannelModel] {
        guard !searchText.isEmpty else { return channels }
        return channels.filter { channel in
            channel.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    init() {
        self.searchText = ""
        self.channels = setupChannels()
    }
    
    private func setupChannels() -> [ChannelModel] {
        var channels = [ChannelModel]()
        for i in 0...100 {

            var title = "Channel title"
            if i < 10 {
                title = "The Fellowship of the Ring"
            } else if i < 20 {
                title = "The Two Towers"
            } else if i < 30 {
                title = "The Return of the King"
            }
            
            channels.append(ChannelModel(id: i, imageStr: "lotr64", title: title))
        }
        return channels
    }
}
