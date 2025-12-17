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
        let descriptor = FetchDescriptor<Goal>(sortBy:[SortDescriptor(\Goal.endDate)])
        
        return (try? modelContext.fetch(descriptor)) ?? []
    }
    
    func ensureSomeDataExists() {
        if goals.isEmpty {
            Goal.insertSampleData(modelContext: modelContext)
        }
    }
    
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
