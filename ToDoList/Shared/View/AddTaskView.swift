//
//  AddView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI

@MainActor
struct AddTaskView<Model>: View where Model: AddTaskViewModelProtocol {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel: Model
    @State var textFieldString: String = ""
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
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

        NavigationView {
            AddTaskView(viewModel: AddTaskViewModelMock())
        }
    }
}
