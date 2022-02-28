//
//  AddView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI

struct AddTaskView: View {
    @State var textFieldString: String = ""
    var addItemViewModel: AddTaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: AddTaskViewModel) {
        self.addItemViewModel = viewModel
    }
    
    @State var alertTile: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("add to do", text: $textFieldString)
                    .cornerRadius(10)
                    .frame(height: 50)

                Button {
                    saveButtonClicked()
                } label: {
                    Text("save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            } .padding()
          
         }
        .navigationTitle("add an item")
        .alert(isPresented: addItemViewModel.$showAlert, content: addItemViewModel.getAlert)
    }
    private func saveButtonClicked() {
        if addItemViewModel.isAppropriate(text: textFieldString) {
            addItemViewModel.addItem(text: textFieldString)
            presentationMode.wrappedValue.dismiss()
        }

    }
  
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext

        NavigationView {
            AddTaskView(viewModel: AddTaskViewModel(context: viewContext))
        }
    }
}
