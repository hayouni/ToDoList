//
//  TaskListViewModelMock.swift
//  ToDoList (iOS)
//
//  Created by Saiefeddine HAYOUNI on 02/03/2022.
//

import Foundation
import CoreData

class TaskListViewModelMock: TaskListViewModelProtocol {
    
    var taskList: [TaskViewModel] = []
    func performFetch() {}
    func deleteItem(taskId: NSManagedObjectID) {}
}
