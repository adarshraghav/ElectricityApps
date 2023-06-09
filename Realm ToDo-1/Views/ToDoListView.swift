//
//  ContentView.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 06/05/23.
//

import SwiftUI
import RealmSwift

struct ToDoListView: View {
    @ObservedResults(ToDo.self) var toDos
    @State private var name = ""
    @State private var searchFilter = ""
    @FocusState private var focus: Bool?
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    TextField("New ToDo...", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button{
                        let newToDo = ToDo(name: name)
                        $toDos.append(newToDo)
                        name=""
                        focus = nil
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(name.isEmpty)
                }
                .padding()
                List(){
//                    ForEach(toDos.sorted(byKeyPath: "completed")) {
                    ForEach(toDos.sorted(by: [
                        SortDescriptor(keyPath: "completed"),
                        SortDescriptor(keyPath: "urgency", ascending:false)
                    ])){
                        toDo in ToDoListRow(toDo: toDo)
                    }
                    .onDelete(perform: $toDos.remove)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .searchable(text: $searchFilter,
                            collection: $toDos,
                            keyPath: \.name) {
                    ForEach(toDos) {
                        toDo in Text(toDo.name).searchCompletion(toDo.name)
                    }
                }
            }
            .animation(.default, value: toDos)
            .navigationTitle("Realm ToDos")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
