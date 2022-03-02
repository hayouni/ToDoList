//
//  TaskDetailsViewModelMock.swift
//  ToDoList (iOS)
//
//  Created by Saiefeddine HAYOUNI on 02/03/2022.
//

import Foundation
import SwiftUI

class TaskDetailsViewModelMock : TaskDetailsViewModelProtocol {
    var name: String {
        "Test Mock"
    }
    
    var createdAt: Date {
        Date()
    }
    
    var header: String {
        "Test Header"
    }
    
    var headerColor: Color {
        .red
    }
}

