
import Foundation
import SwiftData

@Model
final class Task: Identifiable {
    @Attribute(.unique) var id: String
    var title: String
    var completed: Bool
    var dueDate: Date
    var goal: Goal?

    init(title: String, completed: Bool = false, dueDate: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.completed = completed
        self.dueDate = dueDate
    }
}
