//
//  User.swift
//  Friendface
//
//  Created by Aaron Graves on 8/6/24.
//

import Foundation

struct User: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, isActive, name, age, company, email, address, about, registered, tags, friends
    }
    
    var id: UUID = UUID()
    var isActive: Bool = false
    var name: String = ""
    var age: Int = 0
    var company: String = ""
    var email: String = ""
    var address: String = ""
    var about: String = ""
    var registered: Date = .now
    var tags: [String] = []
    var friends: [Friend] = [Friend]()
}
