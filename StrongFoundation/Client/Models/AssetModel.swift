//
//  HomeModel.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import Foundation

struct AssetModel: Model {
    enum Keys: String, CodingKey {
        case id = "id"
        case imageStr = "image"
        case title = "title"
        case description = "description"
    }
    
    public let id: Int
    public let imageStr: String
    public let title: String
    public let description: String
    
    init(id: Int,
         imageStr: String,
         title: String,
         description: String) {
        self.id = id
        self.imageStr = imageStr
        self.title = title
        self.description = description
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: .id, fallback: -1)
        self.imageStr = try container.decodeIfPresent(String.self, forKey: .imageStr, fallback: "")
        self.title = try container.decodeIfPresent(String.self, forKey: .title, fallback: "")
        self.description = try container.decodeIfPresent(String.self, forKey: .description, fallback: "")
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imageStr, forKey: .imageStr)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.description, forKey: .description)
    }
}

extension AssetModel: Identifiable {
    
}
