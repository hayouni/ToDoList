//
//  CoreDataManager.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    let fetch: NSFetchedResultsController<Task>
    private let viewContext: NSManagedObjectContext
    
    private init() {
        persistentContainer = NSPersistentContainer(name: persistentContainerName)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("unable to init core data\(error)")
            }
        }
        viewContext =  persistentContainer.viewContext
        fetch = NSFetchedResultsController(fetchRequest: Task.getAllItems(),
                                           managedObjectContext: viewContext,
                                           sectionNameKeyPath: nil,
                                           cacheName: nil)
    }
 
    func performFetch(_ completion: @escaping ([TaskViewModel]) -> Void) {
        do { try fetch.performFetch()
            guard let tasks = fetch.fetchedObjects else { return }
            completion(tasks.map(TaskViewModel.init))
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
    
    func addItem(title: String) {
        do {
            let item = Task(context: viewContext)
            item.name = title
            item.isCompleted = false
            item.createdAt = Date()
            try item.save()
        } catch {
            print("error")
        }
    }
    
}
