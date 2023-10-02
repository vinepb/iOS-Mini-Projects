//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewModel()

    let item: TodoListItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }

            Spacer()

            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: .init(
            id: "123",
            title: "Bike around",
            dueDate: Date().timeIntervalSince1970,
            isDone: true)).preferredColorScheme(.dark)
    }
}
