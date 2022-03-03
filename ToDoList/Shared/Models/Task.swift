//
//  Task.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData

class Task: NSManagedObject, Identifiable {
    @NSManaged var name: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var createdAt: Date?
    
}

extension Task: BaseModel  {
    
    class func newInstance(name: String, isCompleted:Bool, createdAt:Date,
                           context: NSManagedObjectContext) -> Task {
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task",
                                                       into: context) as! Task
        task.name = name
        task.isCompleted = isCompleted
        task.createdAt = createdAt
        return task
    }
    
    static func getAllItems() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        let sort = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
}



