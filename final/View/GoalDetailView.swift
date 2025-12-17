//
//  GoalDetailView.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import SwiftUI
import SwiftData

struct GoalDetailView: View {
    @Environment(GoalViewModel.self) private var goalViewModel
    let goal: Goal
    
    var body: some View {
//        if let goal = goalViewModel.selectedGoal {
            GoalDetail(goal: goal)
//        }
    }
}
//
//#Preview {
//    GoalDetailView()
//}
