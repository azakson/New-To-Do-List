//
//  AddItemView.swift
//  to do
//
//  Created by Avery Zakson on 2/2/21.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var toDoItems: ToDoList
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let priorities = ["High", "Medium", "Low"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority",  selection: $priority) {
                    ForEach(Self.priorities, id: \.self) { priority in
                        Text(priority)
                        
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New To-Do Item")
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(toDoItems: ToDoList())
    }
}
