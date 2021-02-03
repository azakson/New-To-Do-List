//
//  ContentView.swift
//  To Do List
//
//  Created by Avery Zakson on 1/28/21.
//  Copyright © 2021 Avery Zakson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoItems: ToDoList
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoItems.items) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    toDoItems.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    toDoItems.items.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Things")
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}



