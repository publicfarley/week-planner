
# Project Requirements Document: The GTT Week Planner

## 1. Overview

This document outlines the requirements for a new iOS application, the GTT Week Planner. The app is designed to help users plan their week effectively by connecting high-level goals to daily, actionable tasks.

**Vision:** To create a simple, intuitive, and powerful weekly planning tool that helps users feel in control of their week and make consistent progress on their most important goals.

## 2. The GTT Method: Core Philosophy

The app will be built around the "Goals, Tasks, and Time" (GTT) methodology. This approach has three core components:

*   **Goals:** At the beginning of each week, the user defines 3-5 high-level goals they want to achieve. These are significant outcomes, not granular to-dos.
*   **Tasks:** The user breaks down each goal into small, concrete, and actionable tasks.
*   **Time:** The user allocates each task to a specific day of the week, giving each day a clear focus while maintaining flexibility.

## 3. Target Audience

This app is for professionals, students, and anyone who wants to be more intentional with their time. The target user is someone who:

*   Feels overwhelmed by a long to-do list.
*   Struggles to make progress on big projects.
*   Wants a simple system for weekly planning without excessive features.

## 4. User Stories / Features

### 4.1. Goal Management

*   **G-1:** As a user, I want to create, view, edit, and delete my weekly goals.
*   **G-2:** As a user, I want to see my current weekly goals on the main screen so I can stay focused on the big picture.

### 4.2. Task Management

*   **T-1:** As a user, I want to create a new task and associate it with one of my weekly goals.
*   **T-2:** As a user, I want to assign a task to a specific day of the week.
*   **T-3:** As a user, I want to view all tasks for a given day.
*   **T-4:** As a user, I want to mark a task as complete.
*   **T-5:** As a user, I want to easily move a task from one day to another.
*   **T-6:** As a user, I want to edit or delete a task.

### 4.3. Main View & Navigation

*   **V-1:** As a user, I want to see a view of the current week, with each day clearly displayed.
*   **V-2:** As a user, I want to tap on a day to see the tasks allocated to it.
*   **V-3:** As a user, I want a clear and simple interface that shows my weekly goals and daily tasks.

## 5. Non-Functional Requirements

*   **NFR-1:** The app must be built as a native iOS application using SwiftUI.
*   **NFR-2:** All user data must be stored locally on the device using SwiftData. No backend or internet connection is required.
*   **NFR-3:** The app must be designed for iOS 26 and above.
*   **NFR-4:** The app must follow the principles of Protocol-Oriented Programming and use modern Swift concurrency (async/await).

## 6. Success Metrics

*   **S-1:** High user engagement, measured by the number of weekly goals and daily tasks created.
*   **S-2:** Positive user feedback and App Store reviews.
*   **S-3:** High task completion rate, indicating that the app is helping users be more productive.
