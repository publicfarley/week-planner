
import Testing
import Foundation
@testable import week_planner

struct GoalTests {

    @Test func testGoalInitialization() {
        let title = "Test Goal"
        let goal = Goal(title: title)

        #expect(goal.title == title)
        #expect(goal.tasks == nil)
    }

    @Test func testGoalTaskAssociation() {
        let goal = Goal(title: "Test Goal")
        let task1 = Task(title: "Test Task 1", dueDate: Date())
        let task2 = Task(title: "Test Task 2", dueDate: Date())

        goal.tasks = [task1, task2]

        #expect(goal.tasks != nil)
        #expect(goal.tasks?.count == 2)
        #expect(goal.tasks?.first?.title == "Test Task 1")
    }
}
