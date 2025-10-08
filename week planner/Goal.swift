
import Foundation
import SwiftData

@Model
final class Goal: Identifiable {
    @Attribute(.unique) var id: String
    var title: String
    @Relationship(deleteRule: .cascade) var tasks: [Task]?

    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
