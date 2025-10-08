
import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var goals: [Goal]

    @State private var title: String = ""
    @State private var dueDate: Date = .now
    @State private var selectedGoal: Goal? = nil

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                Picker("Goal", selection: $selectedGoal) {
                    Text("None").tag(nil as Goal?)
                    ForEach(goals) { goal in
                        Text(goal.title).tag(goal as Goal?)
                    }
                }
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newItem = Task(title: title, dueDate: dueDate)
                        newItem.goal = selectedGoal
                        modelContext.insert(newItem)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddTaskView()
}
