//
//  GoalDetailView.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import SwiftUI
import SwiftData

struct GoalDetailView: View {
    let goal: Goal
    
    @State private var isEditing = false
    @State private var isDeleting = false
    
    @Environment(GoalViewModel.self) private var goalViewModel
    
    var body: some View {
            GoalDetail(goal: goal)
            .toolbar {
                Button {
                    isEditing = true
                } label: {
                    Label("Edit \(goal.name)",
                          systemImage: "pencil")
                        .help("Edit the recipe")
                }
                Button {
                    isDeleting = true
                } label: {
                    Label("Delete \(goal.name)",
                          systemImage: "trash")
                        .help("Delete the recipe")
                }
 
            }
            .sheet(isPresented: $isEditing) {
                GoalEditor(goal: goal)
            }
            .alert("Delete \(goal.name)?", isPresented: $isDeleting) {
                Button("Yes, delete \(goal.name)", role: .destructive) {
                    goalViewModel.deleteGoal(goal)
                }
            }
    }
}
//
//#Preview {
//    GoalDetailView()
//}
