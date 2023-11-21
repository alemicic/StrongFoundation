//
//  ItemDetailVM.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 21.11.23..
//

import Foundation
import SwiftUI

class AssetDetailVM: ObservableObject, Navigable {
    @Published var assetModel: AssetModel
    
    init(assetModel: AssetModel) {
        self.assetModel = assetModel
    }
}
