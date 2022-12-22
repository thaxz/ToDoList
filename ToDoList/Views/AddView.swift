//
//  AddView.swift
//  ToDoList
//
//  Created by thaxz on 21/12/22.
//

import SwiftUI

struct AddView: View {
    
    @State var textfieldText: String = ""
    // acessing our list using enviromentObject
    @EnvironmentObject var listViewModel: ListViewModel
    // just to "dismiss" this screen and go back one on our view hierarchy
    @Environment(\.presentationMode) var presentationMode
    
    // creating alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                
                TextField("Type something here", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveNewItem()
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveNewItem(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textfieldText)
            // going back one screen
            presentationMode.wrappedValue.dismiss()
        } else {
            
        }
    }
    
    // checking if the new item is valid to be added
    func textIsAppropriate() -> Bool {
        if textfieldText.count < 3 {
            alertTitle = "Your new item must be at least 3 characters long."
            // telling to show the alert
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
