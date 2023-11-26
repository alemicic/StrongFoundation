//
//  Asset.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 26.11.23..
//

import Foundation

struct Asset: Model {
    enum Keys: String, CodingKey {
        case id = "id"
        case image = "image"
        case title = "title"
        case description = "description"
    }
    
    public let id: Int
    public let image: String
    public let title: String
    public let description: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: .id, fallback: -1)
        self.image = try container.decodeIfPresent(String.self, forKey: .image, fallback: "")
        self.title = try container.decodeIfPresent(String.self, forKey: .title, fallback: "")
        self.description = try container.decodeIfPresent(String.self, forKey: .description, fallback: "")
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Keys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.description, forKey: .description)
    }
}
