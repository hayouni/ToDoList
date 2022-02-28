//
//  AddItemViewModel.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 26/02/2022.
//

import Foundation
import CoreData
import SwiftUI

class AddTaskViewModel: ObservableObject {
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    @State var alertTile: String = ""
    @State var showAlert: Bool = false
   
    private func save(title: String ){
        do {
            let item = Task(context: context)
            item.name = title
            item.isCompleted = false
            item.createdAt = Date()
            try item.save()
        } catch {
            print("error")
        }
        
    }
    
    
    func addItem(text: String) {
            save(title: text)
    }
    
     func isAppropriate(text: String) -> Bool {
        if text.count < 3 {
            alertTile = "more then 3 caracter"
            showAlert.toggle()
            return false
        }
        return true
    }
    
     func getAlert() -> Alert {
        return Alert(title: Text(alertTile))
    }
}


