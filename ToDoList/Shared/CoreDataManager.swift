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
    
    private init() {
        persistentContainer = NSPersistentContainer(name: persistentContainerName)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("unable to init core data\(error)")
            }
        }
    }
}
