//
//  ToDoListItem.swift
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
    
    class func newInstance(name: String, isCompleted:Bool, createdAt:Date,
                           context: NSManagedObjectContext) -> Task {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Task",
                                                       into: context) as! Task
        item.name = name
        item.isCompleted = isCompleted
        item.createdAt = createdAt
        return item
    }
    
}


extension Task: BaseModel  {
    
    static func getAllItems() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        let sort = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
}



