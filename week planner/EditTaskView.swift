
import SwiftUI
import SwiftData

struct EditTaskView: View {
    @Bindable var task: Task
    @Query private var goals: [Goal]

    var body: some View {
        Form {
            TextField("Title", text: $task.title)
            DatePicker("Due Date", selection: $task.dueDate, displayedComponents: .date)
            Picker("Goal", selection: $task.goal) {
                Text("None").tag(nil as Goal?)
                ForEach(goals) { goal in
                    Text(goal.title).tag(goal as Goal?)
                }
            }
        }
        .navigationTitle("Edit Task")
    }
}
