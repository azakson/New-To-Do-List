//
//  to_doApp.swift
//  to do
//
//  Created by Avery Zakson on 1/29/21.
//

import Foundation

class ToDoList: ObservableObject {
    
    @Published var items = [ToDoItem(priority: "High", description: "Take out trash", dueDate: Date()),
                            ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()),
                            ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    
}
