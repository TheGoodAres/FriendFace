//
//  File.swift
//  FriendFace
//
//  Created by Robert-Dumitru Oprea on 16/04/2023.
//

import Foundation

struct User: Codable, Identifiable {
    var id: UUID
    var name: String
    var age: Int
    var company: String
    var isActive: Bool
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}
