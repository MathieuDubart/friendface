//
//  User.swift
//  Friendface
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

struct User: Identifiable, Codable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "John Doe", age: 35, company: "Microsoft", email: "john@doe.com", address: "123 Wall Street bvd", about: "Lorem ipsum dolor sit amet", registered: Date.now, tags: [], friends: [])
}
