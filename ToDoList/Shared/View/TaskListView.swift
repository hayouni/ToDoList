//
//  ListView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI
import CoreData

struct TaskListView: View {
  
    var ViewModel: TaskListViewModel
    @Environment(\.managedObjectContext) var viewContext
    
    init (ViewModel: TaskListViewModel) {
        self.ViewModel = ViewModel
    }
     var body: some View {
        List {
            ForEach(ViewModel.taskList) { item in
                TaskView(item: item)
            }.onDelete(perform: { index in
                deleteTask(at: index)
            })
        }.listStyle(PlainListStyle())
        .navigationTitle("todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("add", destination: AddTaskView(viewModel: AddTaskViewModel(context: viewContext)))
        )
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { Index in
            let task = ViewModel.taskList[Index]
            ViewModel.deleteItem(taskId: task.id)
        }
    }
  
}

struct ListView_Previews: PreviewProvider {

    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext

        NavigationView {
            TaskListView(ViewModel: TaskListViewModel(context: viewContext))
        }
    }
}

