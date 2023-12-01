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
    
    init() {
        self.searchText = ""
        self.channels = setupChannels()
    }
    
    private func setupChannels() -> [ChannelModel] {
        var channels = [ChannelModel]()
        for i in 0...100 {
            channels.append(ChannelModel(id: i, imageStr: "lotr64"))
        }
        return channels
    }
}
