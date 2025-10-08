
import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var dueDate: Date = .now

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
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
