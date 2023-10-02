//
//  TodoListItemsView.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @FirestoreQuery var items: [TodoListItem]

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }

    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    HStack {
                        Text("New Item")
                        Image(systemName: "plus.circle")
                    }
                }.padding()
            }
            .sheet(isPresented: $viewModel.showingNewItemView, onDismiss: {viewModel.showingNewItemView = false}) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        /// Fill this with userId from Firebase
        TodoListView(userId: "").preferredColorScheme(.dark)
    }
}
