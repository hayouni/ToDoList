//
//  ListRowViewModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 27/02/2022.
//

import Foundation
import CoreData

class TaskViewModel: Identifiable {
    
    
    private var item: Task
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    
    init(item: Task) {
        self.item = item
    }
    
    var id: NSManagedObjectID {
        item.objectID
    }
    
    var name: String {
        item.name.orEmpty
    }
    
    var isCompleted: Bool {
        get {
            item.isCompleted
        }
        set {
            updateItem(taskId: id, isCompleted: newValue)
        }
    }
    
    var createdAt: Date {
        item.createdAt ?? Date()
    }
    
    func updateItem(taskId: NSManagedObjectID, isCompleted: Bool) {
        do {
            guard let item = try viewContext.existingObject(with: taskId)  as? Task else { return }
            item.isCompleted = isCompleted
            try item.save()
        } catch {
            print(error)
        }
    }
    
}
