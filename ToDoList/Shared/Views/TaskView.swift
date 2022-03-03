//
//  ListRowView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI
import CoreData

struct TaskView<Model>: View where Model: TaskViewModelProtocol {
    
    @ObservedObject var task: Model

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(task.name)
            Spacer()
            VStack {
                Toggle  (isOn: $task.isCompleted) {
                }
            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            TaskView(task: TaskViewModelMock(isCompleted: true))
            TaskView(task: TaskViewModelMock(isCompleted: false))
        }
    }
}
