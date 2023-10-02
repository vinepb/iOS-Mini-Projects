//
//  ProfileView.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }.navigationTitle("Profile")
        }.onAppear {
            viewModel.fetchUser()
        }
    }

    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.accentColor)
            .frame(width: 125, height: 125)
            .padding()

        VStack(alignment: .leading) {
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }
            HStack {
                Text("Member since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()

        Spacer()

        Button("Log out") {
            viewModel.logOut()
        }.foregroundColor(.red)
            .padding(.bottom)
        Button("Delete account") {
            viewModel.deleteAccount()
        }.foregroundColor(.red)
        .padding(.bottom, 50)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().preferredColorScheme(.dark)
    }
}
