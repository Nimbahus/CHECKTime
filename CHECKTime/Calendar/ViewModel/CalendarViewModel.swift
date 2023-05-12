//
//  CalendarViewModel.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

struct DailyActivity {
    var startDate: Date
    var endDate: Date
}

@MainActor
final class CalendarViewModel: ObservableObject {
    var activities: [DailyActivity]
    
    init(activities: [DailyActivity]) {
        self.activities = activities
    }
}
