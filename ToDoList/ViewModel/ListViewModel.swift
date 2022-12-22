//
//  ListViewModel.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    // published bc we cannot use State in classes
    @Published var items: [ItemModel] = [] {
        // this function is called everytime something has changed inside this array
        didSet {
            saveItems()
        }
    }
    
    // creating our key here so it can be more secure
    let itemsKey: String = "itemsList"
    
    // every class needs an init
    // so we're getting our items every time the class is initialized
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            // getting data from userDefaults
            let data = UserDefaults.standard.data(forKey: itemsKey),
            // decoding it
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        // if successful
        self.saveItems()
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
    
    func saveItems(){
        // encoding our model to JSONdata so we can save using userDefaults
        if let encondedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encondedData, forKey: itemsKey)
        }
    }
    
}
