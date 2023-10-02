//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func login() {
        guard validate() else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password)
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

        return true
    }
}
