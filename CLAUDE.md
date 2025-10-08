# Commit Message Guidelines

## IMPORTANT: No Attribution
- **NEVER include Claude Code attribution in commit messages**
- **NEVER add Co-Authored-By: Claude <noreply@anthropic.com> lines**
- **NEVER include "🤖 Generated with [Claude Code](https://claude.ai/code)" signatures**
- Keep commit messages clean and follow project standards

## Git Workflow Instructions
When creating commits:
1. Generate clean, descriptive commit messages
2. Do not add any attribution to Claude or Claude Code
3. Follow the project's existing commit message format
4. Use conventional commits if specified by the project

## Swift iOS Project Build Configuration

When building Swift iOS projects with xcodebuild, use the correct simulator destination to avoid "Supported platforms for the buildables in the current scheme is empty" error:

**Correct build command:**
```bash
xcodebuild -project PROJECT.xcodeproj -scheme SCHEME -destination 'platform=iOS Simulator,id=490A490A-C97A-43EE-978E-148A74A72499' build
```

**To find available simulators:**
```bash
xcodebuild -project PROJECT.xcodeproj -scheme SCHEME -showdestinations
```

**Working iPhone 16 simulator ID for iOS 26.0:** `490A490A-C97A-43EE-978E-148A74A72499`

## Custom Git Commands

### /merge-feature
Completes the full feature branch merge workflow automatically without asking for permission:
1. Switches to main branch
2. Pulls latest changes from origin/main
3. Merges current feature branch into main
4. Pushes main to origin
5. Deletes the feature branch locally and remotely

**Important**: This command runs non-interactively and will execute all steps automatically. Only use when you're confident the feature branch is ready to merge.

Usage: When you want to merge and clean up a completed feature branch, use `/merge-feature`
- There should be no Claude Code attribution in the source code files. So don't add the following for example:
  `Created by Claude Code on 2025-09-22.`

## Logging Best Practices

### Swift iOS Projects
- **Modern Swift logging using `import OSLog` is required**
- **NEVER use raw `print()` for debugging or logging purposes**
- Use OSLog's Logger type for structured logging with subsystem/category labeling
- Use debug level logging for development and troubleshooting
- Logs should be viewable through Console.app for proper debugging

### Recommended Logger Implementation:
```swift
import OSLog
import Foundation

struct Logger {
    private static let subsystem = "com.yourapp.identifier"
    private static let logger = os.Logger(subsystem: subsystem, category: "general")

    static func debug(_ message: String) {
        logger.debug("\(message, privacy: .public)")
    }
}
```

### Usage:
- Replace: `print("Debug message")`
- With: `Logger.debug("Debug message")`

### Other Programming Languages:
- **Python**: Use `logging` module instead of `print()`
- **JavaScript/Node.js**: Use proper logging libraries like `winston` or `pino` instead of `console.log()`
- **Java**: Use `slf4j` with `logback` instead of `System.out.println()`
- **C#**: Use `ILogger` interface instead of `Console.WriteLine()`

Always prefer structured, configurable logging over basic print statements for production code.

## Swift iOS Core Principles

### iOS Version and UI Requirements
- **Minimum deployment target: iOS 26.0**
- **MUST use maximum Liquid Glass UI patterns** for modern, fluid visual experiences
- SwiftUI with Observation framework (@Observable macro) for state management
- Leverage iOS 26+ features for premium user experiences with fluid animations and depth

### Swift 6 Concurrency
- **MUST use strict Swift 6 concurrency checking**
- Enable complete concurrency checking in compiler settings
- All async code must properly handle Sendable types
- Use appropriate isolation domains (actors, @MainActor)
- Eliminate data races at compile time
- Swift 6 concurrency eliminates threading bugs before they occur

### Global State Management
- **Minimum to no use of global mutable state**
- If the design requires global mutable state, it MUST be an Actor
- Actors provide thread-safe access to mutable state in concurrent environments
- Prefer value types and local state over global mutable state

### Example Actor for Global State:
```swift
actor GlobalStateManager {
    private var state: AppState

    init(initialState: AppState) {
        self.state = initialState
    }

    func updateState(_ newState: AppState) {
        self.state = newState
    }

    func getState() -> AppState {
        state
    }
}
```

### Protocol-Oriented Programming
- **Employ protocol-oriented programming to ensure that side-effecting dependencies are dependency injected**
- All services with external dependencies (persistence, network, system APIs) MUST be defined as protocols
- This facilitates the ability to use protocol-conforming mocks in unit tests
- Protocol-based dependency injection enables true unit testing by allowing mock implementations
- Makes tests faster, more reliable, and independent of external systems

### Example:
```swift
// Define protocol for service
protocol DataServiceProtocol {
    func fetchData() async throws -> [Item]
    func save(_ item: Item) async throws
}

// Production implementation
final class DataService: DataServiceProtocol {
    func fetchData() async throws -> [Item] { /* real implementation */ }
    func save(_ item: Item) async throws { /* real implementation */ }
}

// Mock for testing
final class MockDataService: DataServiceProtocol {
    var mockItems: [Item] = []
    func fetchData() async throws -> [Item] { mockItems }
    func save(_ item: Item) async throws { mockItems.append(item) }
}

// View model using dependency injection
@Observable
final class ItemViewModel {
    private let dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
}
```
- My statusline configuration is in ~/.claude/settings.json and displays the information across multiple color-coded lines.
- The /merge-feature command should run autonomously. It should not ask me for permission on any of the steps.