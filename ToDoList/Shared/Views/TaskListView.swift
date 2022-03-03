//
//  ListView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI
import CoreData

struct TaskListView<Model>: View where Model: TaskListViewModelProtocol {
  
    @ObservedObject private var ViewModel: Model
    var coreDataManager: CoreDataManager = CoreDataManager.shared

    init (ViewModel: Model) {
        self.ViewModel = ViewModel
    }
    
    var body: some View {
        List {
            ForEach(ViewModel.taskList) { task in
                NavigationLink(destination: {
                    TaskDetails(ViewModel: TaskDetailsViewModel(task: task))
                }) {
                    TaskView(task: task)
                }
                
            } .onDelete(perform: { index in
                deleteTask(at: index)
            })
        }.listStyle(PlainListStyle())
            .navigationTitle(taskdListTitle)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink(addTaskButton,
                                   destination: AddTaskView(viewModel: AddTaskViewModel(coreDataManager: coreDataManager)))
            )
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { Index in
            let task = ViewModel.taskList[Index]
            ViewModel.deleteTask(taskId: task.id)
        }
    }
}

struct ListView_Previews: PreviewProvider {

    static var previews: some View {
        let coreDataManager = CoreDataManager.shared
        NavigationView {
            TaskListView(ViewModel: TaskListViewModel(coreDataManager: coreDataManager))
        }
    }
}

