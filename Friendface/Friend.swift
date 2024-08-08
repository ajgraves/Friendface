//
//  Friend.swift
//  Friendface
//
//  Created by Aaron Graves on 8/6/24.
//

import SwiftData
import Foundation

@Model
class Friend: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    var id: UUID = UUID()
    var name: String = ""
    
    
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
