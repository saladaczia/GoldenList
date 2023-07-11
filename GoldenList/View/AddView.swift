//
//  AddView.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 11/07/2023.
//

import SwiftUI

struct AddView: View {
    
    // Text from textField
    @State var textFieldText = ""
    // Showing alert boolean declaration
    @State var showAlert: Bool = false
    
    // Environment listViewModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    // Environment for dissmis view
    @Environment(\.presentationMode) var presentationMode
    
    // BODY
    var body: some View {
        
        ScrollView {
            VStack {
                // TextField with user text
                TextField("Type something...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color("textFieldColor"))
                    .cornerRadius(15)
                .shadow(radius: 25)
                
                // Save button
                Button {
                  saveButton()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 90,height: 40)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                }
                .padding(.top, 20)

            }
            .padding(15)
        }
        .navigationTitle("Add new item")
        // showing alert
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Please type any character!"))
        }
    }
    
    // Save button function
    func saveButton() {
        if checkText() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            showAlert.toggle()
        }
    }
    
    // Check user text function
    func checkText() -> Bool {
        if textFieldText.count < 1 {
            return false
        }
        return true
    }
    
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
