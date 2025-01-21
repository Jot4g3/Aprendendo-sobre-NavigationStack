//
//  TaskView.swift
//  TestingSwiftUIElements
//
//  Created by iredefbmac_33 on 14/01/25.
//

import SwiftUI



struct TaskView: View {
    var task: Task
    
    init(task: Task) {
        self.task = task
    }
    
    var body: some View {
        HStack{
            Text(task.name)
            Spacer()
            Image(systemName:!task.isDone ? "square": "checkmark.square.fill")
                
        }
        .padding()
    }
}
#Preview {
    TaskView(task: Task(name: "TaskExample", isDone: false))
}
 
