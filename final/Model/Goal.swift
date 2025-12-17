//
//  Goal.swift
//  final
//
//  Created by Sarah Walker on 12/17/25.
//

import Foundation
import SwiftData

// important things to have with goal
// goal name: String
// goal description: String?
// goal timePeriod: String? Int?
// goal status: Bool
// goal category: for later

// maybe a workedOnToday Bool
// in the future include a streak feature

@Model
final class Goal: Hashable {
    var name: String
    var goalDescription: String?
    var timePeriod: String?
    var startDate: Date?
    var completed: Bool
    
    init(name: String, goalDescription: String? = nil, timePeriod: String, startDate: Date? = nil, completed: Bool) {
        self.name = name
        self.goalDescription = goalDescription
        self.timePeriod = timePeriod
        self.startDate = Date()
        self.completed = completed
    }
}

