//
//  TaskViewModelMock.swift
//  ToDoList (iOS)
//
//  Created by Saiefeddine HAYOUNI on 02/03/2022.
//

import Foundation


class TaskViewModelMock: TaskViewModelProtocol {
    
    private var task: Task?
    
    init(isCompleted: Bool) {
        task = Task.newInstance(name: "TaskViewModelMock", isCompleted: isCompleted, createdAt: Date(), context: CoreDataManager.shared.persistentContainer.viewContext)
    }
    
    var name: String {
        task?.name ?? ""
    }
    
    var isCompleted: Bool {
        get {
            task?.isCompleted ?? false
        }
        set {
            task?.isCompleted = newValue
        }
    }
    
    var createdAt: Date {
        Date()
    }
}
