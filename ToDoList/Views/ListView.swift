//
//  ListView.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "First", isCompleted: false),
        ItemModel(title: "Second", isCompleted: true),
        ItemModel(title: "Third", isCompleted: false)
    ]
    
    var body: some View {
        List{
            // there's no need for an ID because we already made one at our item model
            ForEach(items)  { item in
                ListRowView(item: item)
                
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To do list")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add",
                               destination: AddView()
                              )
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}
