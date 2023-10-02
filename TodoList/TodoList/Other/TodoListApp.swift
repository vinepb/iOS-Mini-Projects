//
//  TodoListApp.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 04/05/23.
//

import SwiftUI
import FirebaseCore

@main
struct YourApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }
    }
}
