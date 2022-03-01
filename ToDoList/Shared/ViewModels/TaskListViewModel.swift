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
        fetch = NSFetchedResultsController(fetchRequest: Task.getAllItems(),
                                           managedObjectContext: viewContext,
                                           sectionNameKeyPath: nil,
                                           cacheName: nil)
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
}

extension TaskListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let items = controller.fetchedObjects as? [Task] else { return }
        self.taskList = items.map(TaskViewModel.init)
    }
}
