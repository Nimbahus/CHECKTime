//
//  DayEntry.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

struct DayEntry: Identifiable {
    let id = UUID()
    var activities: [DayActivity]
    
    var date: Date? {
        let firstActivity = activities.sorted { $0.startDate < $1.startDate }.first
        return firstActivity?.startDate
    }
    
    var duration: TimeInterval {
        return activities.reduce(0) { partialResult, activity in
            partialResult + activity.duration
        }
    }
}
