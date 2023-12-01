//
//  ListVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 30.11.23..
//

import Foundation
import Combine

class ListVM: ObservableObject {
    @Published var items1: [AssetModel]
    @Published var items2: [AssetModel]
    
    private var service: AssetService
    private var cancellables = Set<AnyCancellable>()
    
    init(assetService: AssetService = AssetService()) {
        self.items1 = []
        self.items2 = []
        self.service = assetService
        fetchAssets()
    }
    
    func fetchAssets() {
        service.getAssets()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in }, receiveValue: { [weak self] assets in
                self?.items1 = assets
                self?.items2 = assets
            })
            .store(in: &cancellables)
    }
}
