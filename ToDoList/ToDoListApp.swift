//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    // creating our enviromental objects so they can be accessed anywhere
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            // now it can be accessed anywhere in our navigation hierarchy
            .environmentObject(listViewModel)
        }
    }
}
