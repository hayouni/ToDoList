//
//  TaskDetailsViewModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 28/02/2022.
//

import Foundation
import SwiftUI

class TaskDetailsViewModel: ObservableObject {
    
    private var task: TaskViewModel
    
    init(task: TaskViewModel) {
        self.task = task
    }
    
    var name: String {
        task.name
    }
    
    var createdAt: Date {
        task.createdAt 
    }
  
    var header: String {
        task.isCompleted ? completedTaskHeaderTitle : nonCompletedTaskHeaderTitle
    }
    var headerColor: Color {
        task.isCompleted ? .green : .red 
    }
    
}


