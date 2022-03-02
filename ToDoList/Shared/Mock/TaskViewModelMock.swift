//
//  TaskViewModelMock.swift
//  ToDoList (iOS)
//
//  Created by Saiefeddine HAYOUNI on 02/03/2022.
//

import Foundation


class TaskViewModelMock: TaskViewModelProtocol {
    

    private var item: Task?
    
    init(isCompleted: Bool) {
        item = Task.newInstance(name: "test", isCompleted: isCompleted, createdAt: Date(), context: CoreDataManager.shared.persistentContainer.viewContext)
    }

    var name: String {
        item?.name ?? ""
    }
    
    var isCompleted: Bool {
        get {
            item?.isCompleted ?? false
        }
        set {
            item?.isCompleted = newValue
        }
    }
    
    var createdAt: Date {
        Date()
    }
}
