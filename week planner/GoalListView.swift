
import SwiftUI
import SwiftData

struct GoalListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var goals: [Goal]
    @State private var showingAddGoal = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(goals) { goal in
                    Text(goal.title)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: { showingAddGoal.toggle() }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddGoal) {
                AddGoalView()
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(goals[index])
            }
        }
    }
}

#Preview {
    GoalListView()
        .modelContainer(for: Goal.self, inMemory: true)
}
