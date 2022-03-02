//
//  ListRowView.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 25/02/2022.
//

import SwiftUI
import CoreData

struct TaskView<Model>: View where Model: TaskViewModelProtocol {
    
    @ObservedObject var item: Model

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.name)
            Spacer()
            VStack {
                Toggle  (isOn: $item.isCompleted) {
                }
            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            TaskView(item: TaskViewModelMock(isCompleted: true))
            TaskView(item: TaskViewModelMock(isCompleted: false))
        }
    }
}
