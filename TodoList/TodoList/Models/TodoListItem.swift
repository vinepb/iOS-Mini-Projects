//
//  TodoListItem.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    var isDone: Bool

    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
