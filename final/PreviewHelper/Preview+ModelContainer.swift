//
//  Preview+ModelContainer.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//  From project 2 and SampleSwiftData

import SwiftData

extension ModelContainer {
    static var sample: () throws -> ModelContainer = {
        let schema = Schema(Goal.self)
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [configuration])
        Task { @MainActor in
            Goal.insertSampleData(modelContext: container.mainContext)
        }
        return container
    }
}
