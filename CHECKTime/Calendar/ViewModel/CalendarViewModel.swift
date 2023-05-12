//
//  CalendarViewModel.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

@MainActor
final class CalendarViewModel: ObservableObject {
    var activities: [DayActivity]
    
    init(activities: [DayActivity]) {
        self.activities = activities
    }
}
