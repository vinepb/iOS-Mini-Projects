//
//  ExpenseTrackingApp.swift
//  ExpenseTracking
//
//  Created by Vinicius Bernardo on 30/09/23.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackingApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Expense.self])
    }
}
