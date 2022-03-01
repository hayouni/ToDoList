//
//  AddView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI

@MainActor
struct AddTaskView: View {
    @State var textFieldString: String = ""
    @StateObject  var viewModel = AddTaskViewModel(context: CoreDataManager.shared.persistentContainer.viewContext)
    @State private var showAlert: Bool = false

    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        ScrollView {
            VStack {
                TextField(addTaskTitle, text: $textFieldString)
                    .cornerRadius(10)
                    .frame(height: 50)

                Button {
                    saveButtonClicked()
                } label: {
                    Text(addTaskButton)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            } .padding()
          
         }
        .navigationTitle(addTaskTitle)
        .alert(isPresented: $viewModel.showAlert, content: viewModel.getAlert)
    }
    private func saveButtonClicked() {
        if  viewModel.isAppropriate(text: textFieldString) {
            viewModel.addItem(text: textFieldString)
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
