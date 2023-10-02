//
//  User.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let joined: TimeInterval
}
