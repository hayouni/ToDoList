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
    @StateObject  var listViewModel = TaskListViewModel(coreDataManager: CoreDataManager.shared)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TaskListView(ViewModel: TaskListViewModel(coreDataManager: CoreDataManager.shared))
            }.navigationViewStyle(.stack)
             .environment(\.managedObjectContext, context)
        }
    }
}
