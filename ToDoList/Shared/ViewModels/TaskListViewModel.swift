//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData
import SwiftUI


class TaskListViewModel: NSObject, ObservableObject {

    @Published var taskList = [TaskViewModel]()
    private let fetch: NSFetchedResultsController<Task>
    private (set) var viewContext: NSManagedObjectContext

    init (context: NSManagedObjectContext) {
        self.viewContext = context
        fetch = NSFetchedResultsController(fetchRequest: Task.getAllItems(), managedObjectContext: viewContext, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetch.delegate = self
        performFetch()
    }
    
    func performFetch() {
        do { try fetch.performFetch()
            guard let tasks = fetch.fetchedObjects else { return }
            self.taskList = tasks.map(TaskViewModel.init)
        } catch {
            print(error)
        }
    }

    
    func deleteItem(taskId: NSManagedObjectID) {
        do {
            guard let item = try viewContext.existingObject(with: taskId)  as? Task else { return }
            try item.delete()
        } catch {
            print(error)
        }
    }
    
    func addItem (title: String ){
        let newItem = Task(context: viewContext)
        newItem.name = title
        newItem.isCompleted = false
        newItem.createdAt = Date()
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

extension TaskListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let items = controller.fetchedObjects as? [Task] else { return }
        self.taskList = items.map(TaskViewModel.init)
    }
}
