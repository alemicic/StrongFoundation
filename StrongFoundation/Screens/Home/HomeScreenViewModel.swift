//
//  HomeViewModel.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import Foundation
import Combine
import SwiftUI

class HomeScreenViewModel: ObservableObject {
    // MARK: Bindings
    @Published var items: [AssetModel] {
        didSet {
            idValue = (items.last?.id ?? idValue) + 1
        }
    }
    @Published var title = ""
    @Published var description = ""
    
    // MARK: Variables
    private var idValue = 0
    public var autoIncrement: Int {
        idValue += 1
        return idValue - 1
    }
    
    let didComplete = PassthroughSubject<AssetModel, Never>()
    
    func didTapAssetDetails(assetModel: AssetModel) {
        didComplete.send(assetModel)
    }
    
    // MARK: Init
    init(items: [AssetModel],
         assetService: AssetService = AssetService()) {
        self.items = items
    }
    
    func resetValues() {
        title = ""
        description = ""
    }
}
