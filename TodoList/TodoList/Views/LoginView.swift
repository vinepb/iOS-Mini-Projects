//
//  LoginView.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            HeaderView(
                title: "To Do List", subTitle: "Get things done!", angle: 15.0,
                backgroundColor: .accentColor
            ).offset(y: 50)

            Form {
                TextField("Email Address", text: $viewModel.email).textFieldStyle(
                    DefaultTextFieldStyle()
                ).autocapitalization(.none).autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Log In", backgroundColor: Color.accentColor) {
                    viewModel.login()
                }.padding()
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
            }

            VStack {
                Text("Don't have an account?")
                NavigationLink("Create an Account", destination: RegisterView())
            }
            .padding(.bottom)

            Spacer()
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {

        LoginView()
            .preferredColorScheme(.dark)

    }
}
