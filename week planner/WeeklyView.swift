
import SwiftUI
import SwiftData

struct WeeklyView: View {
    @Query private var tasks: [Task]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(0..<7) { day in
                    Section(header: Text(dayOfWeek(day: day))) {
                        ForEach(tasks(for: day)) { task in
                            NavigationLink(destination: EditTaskView(task: task)) {
                                TaskRowView(task: task)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Weekly View")
        } detail: {
            Text("Select a task")
        }
    }

    private func dayOfWeek(day: Int) -> String {
        let today = Calendar.current.startOfDay(for: .now)
        let date = Calendar.current.date(byAdding: .day, value: day, to: today)!
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }

    private func tasks(for day: Int) -> [Task] {
        let today = Calendar.current.startOfDay(for: .now)
        let date = Calendar.current.date(byAdding: .day, value: day, to: today)!
        return tasks.filter { Calendar.current.isDate($0.dueDate, inSameDayAs: date) }
    }
}

#Preview {
    WeeklyView()
        .modelContainer(for: Task.self, inMemory: true)
}
