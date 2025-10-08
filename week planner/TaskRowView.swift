
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
    }
}
