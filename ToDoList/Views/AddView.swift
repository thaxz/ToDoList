//
//  AddView.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import SwiftUI

struct AddView: View {
    @State var textfieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                
                TextField("Type something here", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.20))
                    .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("SAVE")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

            }
            .padding(14)
            
        }
        .navigationTitle("Add an item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
