//
//  ItemModel.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    // Item model conforms to identifiable protocol
    // And conforms to codable protocol so it can be encoded and decoded
    let id: String
    let title: String
    let isCompleted: Bool
    
    // saying that if we already have an id, there's no need to create another
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // making this func to change the completion status when the user clicks on a specific row
    func updateCompletion()-> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
