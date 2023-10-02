//
//  RegisterView.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack {
            HeaderView(
                title: "Register", subTitle: "Start organizing todos", angle: -15.0,
                backgroundColor: .accentColor)

            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", backgroundColor: Color.accentColor) {
                    viewModel.register()
                }.padding()
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
            }.offset(y: -50)

            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().preferredColorScheme(.dark)
    }
}
