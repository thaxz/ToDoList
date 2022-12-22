//
//  ListView.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import SwiftUI

struct ListView: View {
    
    // acessing our model that we set as an environment object
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            // If it's empty, show message
            if listViewModel.items.isEmpty {
               NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    // there's no need for an ID because we already made one at our item model
                    ForEach(listViewModel.items)  { item in
                        ListRowView(item: item)
                        // what's going to happen when you touch an item
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
//                .listStyle(InsetListStyle())
            }
        }
        // customizing navigation and navItems
        .navigationTitle("To do list")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
