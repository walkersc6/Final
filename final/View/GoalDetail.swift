//
//  GoalDetail.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import SwiftUI

struct GoalDetail: View {
    let goal: Goal
//    @Environment(GoalViewModel.self) private var goalViewModel
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .center, spacing: 8) {
                    Text("\(goal.name)")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    if let descript = goal.goalDescription, !descript.isEmpty {
                        Text("\(descript)")
                            .multilineTextAlignment(.center)
                    }
                }
            }
            
            Section {
                if let time = goal.timePeriod, !time.isEmpty {
                    Text("Time Period: \(time)")
                }
                if let startDate = goal.startDate {
                    Text("End Date: \(startDate, style: .date)")
                }
                Text("Completed: \(goal.completed ? "Yes" : "No")")
            }
            
        }
    }
}

