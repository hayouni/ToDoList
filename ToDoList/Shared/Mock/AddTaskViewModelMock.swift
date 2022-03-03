//
//  AddTaskViewModelMock.swift
//  ToDoList (iOS)
//
//  Created by Saiefeddine HAYOUNI on 02/03/2022.
//

import Foundation
import SwiftUI

class AddTaskViewModelMock: AddTaskViewModelProtocol {
    @Published public var showAlert: Bool = false
    @Published var alertTile: String = ""

    func addTask(title: String) {}
    
    func isAppropriate(text: String) -> Bool {
        if text.count < 3 {
            alertTile = alertTitleString
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTile))
    }
    
}

