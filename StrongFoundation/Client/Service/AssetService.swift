//
//  AssetService.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 26.11.23..
//

import Foundation
import Combine

protocol AssetServiceProtocol {
    func getAssets() -> AnyPublisher<[Asset], Error>
}

class AssetService: AssetServiceProtocol {
    let client = Client<AssetsEndpoint>()
    
    func getAssets() -> AnyPublisher<[Asset], Error> {
        return client.request(.getAssets)
    }
}
