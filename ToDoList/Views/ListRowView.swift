//
//  ListRowView.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import SwiftUI

struct ListRowView: View {
    
    var item: ItemModel
    
    var body: some View {
        // List UI
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    //testing things out
    static var item1: ItemModel = ItemModel(title: "First", isCompleted: false)
    static var item2: ItemModel = ItemModel(title: "Second", isCompleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
