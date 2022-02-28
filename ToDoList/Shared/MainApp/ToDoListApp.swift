//
//  ToDoListApp.swift
//  Shared
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI

@main
struct ToDoListApp: App {

    let context = CoreDataManager.shared.persistentContainer.viewContext
    @StateObject  var listViewModel = TaskListViewModel(context: CoreDataManager.shared.persistentContainer.viewContext)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView(ViewModel: TaskListViewModel(context: context))
            } .environment(\.managedObjectContext, context)
        }
    }
}
