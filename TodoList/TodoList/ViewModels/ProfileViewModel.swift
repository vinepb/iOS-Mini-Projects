//
//  ProfileViewViewModel.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil

    init() {}

    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }

            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }

    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }

    func deleteAccount() {
        if user == nil {
            fetchUser()
        }
        guard let user else {
            return
        }
        removeUserRecord(id: user.id)
        Auth.auth().currentUser?.delete()
    }

    private func removeUserRecord(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .delete()
    }
}
