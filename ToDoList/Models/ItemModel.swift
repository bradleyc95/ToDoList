//
//  ItemModel.swift
//  ToDoList
//
//  Created by Bradley Cox on 4/18/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let desc: String
    let dueDate: Date
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, desc: String = "", dueDate: Date = Date(), isCompleted: Bool) {
        self.id = id
        self.title = title
        self.desc = desc
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, desc: desc, dueDate: dueDate, isCompleted: !isCompleted)
    }
}
