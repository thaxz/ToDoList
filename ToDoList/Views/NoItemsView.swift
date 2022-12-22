//
//  NoItemsView.swift
//  ToDoList
//
//  Created by thaxz on 22/12/22.
//

import SwiftUI

struct NoItemsView: View {
    
    var body: some View {
        VStack{
            Spacer()
            Text("Your list is empty.")
                .font(.title)
                .fontWeight(.semibold)
            Text("Try adding more items!")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.secondary)
            Spacer()
                .frame(height: 24)
            NavigationLink {
                AddView()
            } label: {
                Text("Add something")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(20)
            }
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(40)
    }
     
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("To do list")
        }
    }
}
