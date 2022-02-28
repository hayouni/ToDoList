//
//  CoreDataManager.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    enum constant {
        static let persistentContainerName = "ToDoListModel"
    }
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: constant.persistentContainerName)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("unable to init core data\(error)")
            }
        }
    }
}
