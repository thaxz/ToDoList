//
//  ListViewModel.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    // published bc we cannot use State in classes
    @Published var items: [ItemModel] = []
    
    // every class needs an init
    // so we're getting our items every time the class is initialized
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "First", isCompleted: false),
            ItemModel(title: "Second", isCompleted: true),
            ItemModel(title: "Third", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        // figuring out which is the index
        if let index = items.firstIndex(where: {$0.id == item.id }){
            // switching its state (completed to non-completed)
            items[index] = item.updateCompletion()
        }
    }
    
}
