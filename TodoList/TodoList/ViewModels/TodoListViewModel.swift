//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import FirebaseFirestore
import Foundation

/// View model for list of items
class TodoListViewModel: ObservableObject {
    @Published var showingNewItemView = false

    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    /// Delete to do list item
    /// - Parameter id: Item id to dele
    func delete(id: String) {
        let db = Firestore.firestore()

        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
