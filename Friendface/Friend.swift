//
//  Friend.swift
//  Friendface
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import Foundation

struct Friend: Identifiable, Codable {
    let id: UUID
    let name: String
}
