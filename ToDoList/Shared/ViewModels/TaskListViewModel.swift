//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData
import SwiftUI

protocol TaskListViewModelProtocol: ObservableObject  {
    var taskList: [TaskViewModel] { get set }
    func performFetch()
    func deleteItem(taskId: NSManagedObjectID)
}

class TaskListViewModel: NSObject, ObservableObject, TaskListViewModelProtocol {
    
    @Published var taskList = [TaskViewModel]()
    private var fetch: NSFetchedResultsController<Task>
    var coreDataManager: CoreDataManager
    init (coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
        fetch = coreDataManager.fetch
        super.init()
        performFetch()
        fetch.delegate = self
    }
    
    func performFetch() {
        CoreDataManager.shared.performFetch { items in
            self.taskList = items
        }

    }
    func deleteItem(taskId: NSManagedObjectID) {
        CoreDataManager.shared.deleteItem(taskId: taskId)
    }
}

extension TaskListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let items = controller.fetchedObjects as? [Task] else { return }
        self.taskList = items.map(TaskViewModel.init)
    }
}
