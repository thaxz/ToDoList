//
//  ItemModel.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import Foundation

struct ItemModel: Identifiable {
    // Item model conforms to identifiable protocol
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
