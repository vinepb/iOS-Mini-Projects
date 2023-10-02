//
//  TLButton.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 12/05/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(Color.primary)
                    .bold()
            }
        }
    }
}
