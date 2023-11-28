//
//  AssetService.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 26.11.23..
//

import Foundation
import Combine

protocol AssetServiceProtocol {
    func getAssets() -> AnyPublisher<[AssetModel], Error>
}

class AssetService: AssetServiceProtocol {
    let client = Client<AssetsEndpoint>()
    
    func getAssets() -> AnyPublisher<[AssetModel], Error> {
        return client.request(.getAssets)
    }
}
