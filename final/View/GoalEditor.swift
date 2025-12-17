//
//  GoalEditor.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import SwiftUI

struct GoalEditor: View {
    let goal: Goal?
    
    @State private var name = ""
    @State private var goalDescription = ""
    @State private var timePeriod = ""
    @State private var completed = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(GoalViewModel.self) private var goalViewModel
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $goalDescription)
                
                Section {
                    TextField("Time Period", text: $timePeriod)
                    Toggle("Completed", isOn: $completed)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    withAnimation {
                        save()
                        dismiss()
                    }
                }
                // Require a category to save changes.
                .disabled(name.isEmpty)
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
    }
    
    private func save() {
        if let goal {
            goal.name = name
            goal.goalDescription = goalDescription.isEmpty ? nil : goalDescription
            goal.timePeriod = timePeriod.isEmpty ? nil: timePeriod
            goal.completed = completed
            
            goalViewModel.update()
        } else {
            let newGoal = Goal(
                name: name,
                goalDescription: goalDescription.isEmpty ? nil : goalDescription,
                timePeriod: timePeriod,
                startDate: Date(),
                completed: completed
            )
            goalViewModel.insertGoal(newGoal)
        }
    }
    
    
}

