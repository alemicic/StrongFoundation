//
//  AssetsEndpoint.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 26.11.23..
//

import Foundation

enum AssetsEndpoint: APIEndpoint {
    case getAssets
    
    var baseURL: URL {
        return URL(string: "https://run.mocky.io/v3")!
    }
    
    var path: String {
        switch self {
            case .getAssets:
                return "/be5fea61-75b5-413d-afd6-cfef625b4760"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getAssets:
                return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
            case .getAssets:
                ["" : ""]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
            case .getAssets:
                return ["" : ""]
        }
    }
}
