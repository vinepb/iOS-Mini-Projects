//
//  RegisterViewModel.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init () {}

    func register() {
        guard validate() else {
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }

            self?.insertUserRecord(id: userID)
        }
    }

    private func insertUserRecord(id: String) {
        let newUser = User(id: id, email: email, joined: Date().timeIntervalSince1970)

        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }

    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all fields."
            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valied email."
            return false
        }

        guard password.count >= 6 else {
            errorMessage = "Password needs at least six characters."
            return false
        }

        return true
    }
}
