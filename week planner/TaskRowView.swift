
import SwiftUI

struct TaskRowView: View {
    @Bindable var task: Task

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.completed)
                if let goal = task.goal {
                    Text(goal.title)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .strikethrough(task.completed)
                }
            }
            Spacer()
            Toggle(isOn: $task.completed) {
                Text("")
            }
        }
        .contextMenu {
            Button(action: {
                move(days: -1)
            }) {
                Text("Move to Previous Day")
                Image(systemName: "arrow.left")
            }
            Button(action: {
                move(days: 1)
            }) {
                Text("Move to Next Day")
                Image(systemName: "arrow.right")
            }
        }
    }

    private func move(days: Int) {
        task.dueDate = Calendar.current.date(byAdding: .day, value: days, to: task.dueDate)!
    }
}
