
import SwiftUI
import SwiftData

struct AddGoalView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
            }
            .navigationTitle("New Goal")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newGoal = Goal(title: title)
                        modelContext.insert(newGoal)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddGoalView()
}
