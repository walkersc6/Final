//
//  SampleData+Goal.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import Foundation
import SwiftData

extension Goal {
    static let run = Goal(
        name: "Run 5k",
        goalDescription: "Prepare myself for my 5K in March",
        timePeriod: "Daily",
        endDate: ISO8601DateFormatter().date(from:  "2026-03-01T00:00:00ZUTC"),
        completed: false,
    )
    static let scriptures = Goal(
        name: "Read Scriptures",
        goalDescription: "Read the scriptures daily for the blessings President Nelson promised",
        timePeriod: "Daily",
        endDate: ISO8601DateFormatter().date(from:  "2026-12-31T00:00:00ZUTC"),
        completed: false,
    )
    static let food = Goal(
        name: "Learn a new recipe",
        goalDescription: "How am I supposed to catch me a man if all I know how to do is boil water and make a grilled cheese?",
        timePeriod: "Weekly",
        endDate: ISO8601DateFormatter().date(from: "2026-06-01"),
        completed: false,
    )
    static let exam = Goal(
        name: "Take Econ Exam",
        goalDescription: "Study and take the econ exam with the confidence of a sales bro selling solar in Oregon",
        timePeriod: "Daily",
        endDate: ISO8601DateFormatter().date(from: "2025-12-17"),
        completed: true
    )
    
    static func insertSampleData(modelContext: ModelContext) {
        modelContext.insert(run)
        modelContext.insert(scriptures)
        modelContext.insert(food)
        modelContext.insert(exam)
    }
}
