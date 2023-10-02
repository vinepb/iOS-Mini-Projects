//
//  ContentView.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 04/05/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }

    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId).tabItem {
                Label("Home", systemImage: "house")
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().preferredColorScheme(.dark)
    }
}
