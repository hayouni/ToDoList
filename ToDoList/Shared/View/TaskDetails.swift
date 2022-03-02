//
//  TaskDetails.swift
//  ToDoList
//
//  Created by Saiefeddine HAYOUNI on 28/02/2022.
//

import SwiftUI

struct TaskDetails: View {
    
    var ViewModel: TaskDetailsViewModelProtocol

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
    
    static var previews: some View {
        TaskDetails(ViewModel:TaskDetailsViewModelMock())
    }
}
