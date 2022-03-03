//
//  ListRowViewModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 27/02/2022.
//

import Foundation
import CoreData

protocol TaskViewModelProtocol: Identifiable, ObservableObject {
    var name: String { get }
    var isCompleted: Bool { get set }
    var createdAt: Date { get }
}

class TaskViewModel: Identifiable, TaskViewModelProtocol  {
    
    private var task: Task
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    
    init(task: Task) {
        self.task = task
    }
    
    var id: NSManagedObjectID {
        task.objectID
    }
    
    var name: String {
        task.name.orEmpty
    }
    
    var isCompleted: Bool {
        get {
            task.isCompleted
        }
        set {
            updateTask(taskId: id, isCompleted: newValue)
        }
    }
    
    var createdAt: Date {
        task.createdAt ?? Date()
    }
    
    func updateTask(taskId: NSManagedObjectID, isCompleted: Bool) {
        do {
            guard let task = try viewContext.existingObject(with: taskId)  as? Task else { return }
            task.isCompleted = isCompleted
            try task.save()
        } catch {
            print(error)
        }
    }
    
}
