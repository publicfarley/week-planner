
import Testing
import Foundation
import SwiftData
@testable import week_planner

@MainActor
@Suite
struct SwiftDataPersistenceTests {

    var container: ModelContainer!
    var context: ModelContext {
        container.mainContext
    }

    init() {
        do {
            container = try ModelContainer(for: Task.self, Goal.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        } catch {
            fatalError("Failed to create ModelContainer for testing: \(error)")
        }
    }

    @Test func testSaveAndFetchGoal() async throws {
        let newGoal = Goal(title: "Test Goal")
        context.insert(newGoal)
        try context.save()

        let fetchedGoals = try context.fetch(FetchDescriptor<Goal>())
        #expect(fetchedGoals.count == 1)
        #expect(fetchedGoals.first?.title == "Test Goal")
    }

    @Test func testUpdateGoal() async throws {
        let newGoal = Goal(title: "Original Goal")
        context.insert(newGoal)
        try context.save()

        let fetchedGoal = try context.fetch(FetchDescriptor<Goal>()).first
        #expect(fetchedGoal != nil)

        fetchedGoal?.title = "Updated Goal"
        try context.save()

        let updatedGoal = try context.fetch(FetchDescriptor<Goal>()).first
        #expect(updatedGoal?.title == "Updated Goal")
    }

    @Test func testDeleteGoal() async throws {
        let newGoal = Goal(title: "Goal to Delete")
        context.insert(newGoal)
        try context.save()

        var fetchedGoals = try context.fetch(FetchDescriptor<Goal>())
        #expect(fetchedGoals.count == 1)

        context.delete(newGoal)
        try context.save()

        fetchedGoals = try context.fetch(FetchDescriptor<Goal>())
        #expect(fetchedGoals.isEmpty)
    }

    @Test func testSaveAndFetchTask() async throws {
        let newTask = Task(title: "Test Task", dueDate: Date())
        context.insert(newTask)
        try context.save()

        let fetchedTasks = try context.fetch(FetchDescriptor<Task>())
        #expect(fetchedTasks.count == 1)
        #expect(fetchedTasks.first?.title == "Test Task")
    }

    @Test func testUpdateTask() async throws {
        let newTask = Task(title: "Original Task", dueDate: Date())
        context.insert(newTask)
        try context.save()

        let fetchedTask = try context.fetch(FetchDescriptor<Task>()).first
        #expect(fetchedTask != nil)

        fetchedTask?.title = "Updated Task"
        try context.save()

        let updatedTask = try context.fetch(FetchDescriptor<Task>()).first
        #expect(updatedTask?.title == "Updated Task")
    }

    @Test func testDeleteTask() async throws {
        let newTask = Task(title: "Task to Delete", dueDate: Date())
        context.insert(newTask)
        try context.save()

        var fetchedTasks = try context.fetch(FetchDescriptor<Task>())
        #expect(fetchedTasks.count == 1)

        context.delete(newTask)
        try context.save()

        fetchedTasks = try context.fetch(FetchDescriptor<Task>())
        #expect(fetchedTasks.isEmpty)
    }

    @Test func testGoalTaskRelationshipPersistence() async throws {
        let newGoal = Goal(title: "Goal with Tasks")
        let task1 = Task(title: "Task 1 for Goal", dueDate: Date())
        let task2 = Task(title: "Task 2 for Goal", dueDate: Date())

        newGoal.tasks = [task1, task2]
        task1.goal = newGoal
        task2.goal = newGoal

        context.insert(newGoal)
        context.insert(task1)
        context.insert(task2)
        try context.save()

        let fetchedGoal = try context.fetch(FetchDescriptor<Goal>()).first
        #expect(fetchedGoal?.title == "Goal with Tasks")
        #expect(fetchedGoal?.tasks?.count == 2)
        #expect(fetchedGoal?.tasks?.first?.title == "Task 1 for Goal")

        let fetchedTasks = try context.fetch(FetchDescriptor<Task>())
        #expect(fetchedTasks.count == 2)
        #expect(fetchedTasks.first?.goal?.title == "Goal with Tasks")
    }
}
