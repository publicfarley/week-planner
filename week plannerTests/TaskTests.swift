
import Testing
import Foundation
@testable import week_planner

struct TaskTests {

    @Test func testTaskInitialization() {
        let title = "Test Task"
        let dueDate = Date()
        let task = Task(title: title, dueDate: dueDate)

        #expect(task.title == title)
        #expect(task.dueDate == dueDate)
        #expect(task.completed == false)
        #expect(task.goal == nil)
    }

    @Test func testTaskGoalAssociation() {
        let goal = Goal(title: "Test Goal")
        let task = Task(title: "Test Task", dueDate: Date())
        task.goal = goal

        #expect(task.goal != nil)
        #expect(task.goal?.title == "Test Goal")
    }
}
