//
//  HomeViewModel.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import Foundation

class HomeViewModel: ObservableObject {
    // MARK: Bindings
    @Published var items: [AssetModel]
    @Published var title = ""
    @Published var description = ""
    
    // MARK: Variables
    private var idValue = 0
    public var autoIncrement: Int {
        idValue += 1
        return idValue - 1
    }
    // MARK: Init
    init(items: [AssetModel]) {
        self.items = items
    }
    
    func resetValues() {
        title = ""
        description = ""
    }
}
