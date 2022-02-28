//
//  ListRowView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI
import CoreData

struct TaskView: View {
    
    @State var item: TaskViewModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.name)
            Spacer()
            VStack {
                Toggle  (isOn: $item.isCompleted) {
                
                }
            }
        }
    }
}


struct ListRowView_Previews: PreviewProvider {

    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        let item = Task().createItem(name: "test", isCompleted: false, createdAt: Date())
        VStack {
            TaskListView(ViewModel: TaskListViewModel(context: viewContext))
        }
    }
}

public extension Optional where Wrapped == String {
    var orEmpty: String { self ?? "" }
}
