//
//  GoalViewModel.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import SwiftUI
import SwiftData

@Observable
class GoalViewModel: ContextReferencing {
    private var modelContext: ModelContext
    
    var selectedGoal: Goal?
    
    // initializor
    required init(modelContext: ModelContext) {
        self.modelContext = modelContext
        ensureSomeDataExists()
    }
    
    // based off Project 2
    var goals: [Goal] {
        let descriptor = FetchDescriptor<Goal>(sortBy:[SortDescriptor(\Goal.startDate)])
        
        return (try? modelContext.fetch(descriptor)) ?? []
    }
    
    func deleteGoal(_ goal: Goal) {
        modelContext.delete(goal)
        update()
    }
    
    func ensureSomeDataExists() {
        if goals.isEmpty {
            Goal.insertSampleData(modelContext: modelContext)
        }
    }
    
    func insertGoal(_ goal: Goal) {
        modelContext.insert(goal)
        update()
    }
    
//    func saveGoal(_ goal: Goal, name: String, goalDescription: String, timePeriod: String, completed: Bool) {
//            goal.name = name
//            goal.goalDescription = goalDescription.isEmpty ? nil : goalDescription
//            goal.timePeriod = timePeriod.isEmpty ? nil : timePeriod
//            goal.completed = completed
//    }
    
    func update() {
        do {
            try modelContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}

//#Preview {
//    GoalViewModel()
//}
