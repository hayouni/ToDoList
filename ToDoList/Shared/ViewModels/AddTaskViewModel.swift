//
//  AddItemViewModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData
import SwiftUI

protocol AddTaskViewModelProtocol: ObservableObject {
    func addItem(text: String)
    func isAppropriate(text: String) -> Bool
    func getAlert() -> Alert
    var showAlert: Bool {get set}
}

class AddTaskViewModel: ObservableObject, AddTaskViewModelProtocol {
    
     var coreDataManager: CoreDataManager
    @Published var alertTile: String = ""
    @Published public var showAlert: Bool = false
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }

    func addItem(text: String) {
        coreDataManager.addItem(title: text)
    }
    
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
