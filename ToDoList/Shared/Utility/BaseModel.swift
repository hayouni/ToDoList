//
//  BaseModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get }
    func save() throws
    func delete() throws

}

extension BaseModel  where Self: NSManagedObject {
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentContainer.viewContext
     }
    func save() throws {
        try Self.viewContext.save()
    }
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}
