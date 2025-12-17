//
//  GoalDetail.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import SwiftUI

struct GoalDetail: View {
    let goal: Goal
    @Environment(GoalViewModel.self) private var goalViewModel
    
    var body: some View {
        VStack {
            Text("\(goal.name)")
                .font(.title2)
            if let descript = goal.goalDescription, !descript.isEmpty {
                Text("Description:")
                Text("\(descript)")
            }
            Spacer()
            
            if let time = goal.timePeriod, !time.isEmpty {
                Text("Time Period: \(time)")
            }
            if let endDate = goal.endDate {
                Text("End Date: \(endDate)")
            }
            Text("Completed: \(goal.completed ? "Yes" : "No")")
        }
    }
}

