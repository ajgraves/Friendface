//
//  Friend.swift
//  Friendface
//
//  Created by Aaron Graves on 8/6/24.
//

import Foundation

struct Friend: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    var id: UUID = UUID()
    var name: String = ""
}
