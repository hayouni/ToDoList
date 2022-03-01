//
//  TaskDetails.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 28/02/2022.
//

import SwiftUI

struct TaskDetails: View {
    
    var ViewModel: TaskDetailsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(ViewModel.header)
                .foregroundColor(ViewModel.headerColor)
                .font(.headline)
            Text(taskDetailTitle)
                .font(.headline)
            Text(ViewModel.name)
                .foregroundColor(.secondary)
            Text(taskDetailCreatedAt)
                .font(.headline)
            Text("\(ViewModel.createdAt)")
                .foregroundColor(.secondary)
            Spacer()
        } .navigationTitle(taskDetailNavigationTitle)
            .font(.subheadline)
            

    }
}

struct TaskDetails_Previews: PreviewProvider {
    static var task : mock = mock()
    static var model = TaskViewModel(item: task.item)
    static var previews: some View {
        TaskDetails(ViewModel: TaskDetailsViewModel(task: model))
    }
}
