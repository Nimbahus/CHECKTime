//
//  DayEntry.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

struct DayEntry {
    var activities: [DayActivity]
    var duration: TimeInterval {
        return activities.reduce(0) { partialResult, activity in
            partialResult + activity.duration
        }
    }
}
