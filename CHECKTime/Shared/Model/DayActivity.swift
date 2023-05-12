//
//  DayActivity.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

struct DayActivity: Identifiable {
    
    var id: UUID = UUID()
    var startDate: Date
    var endDate: Date
    var color: String
    var activityType: Activity
    
    var duration: TimeInterval {
        return (endDate - startDate)
    }
    
    func fullFormat() -> String {
        let delta = Int(duration)
        let seconds = delta % 60
        let minutes = (delta / 60) % 60
        let hours = (delta / 3600)
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func shortFormat() -> String {
        //TODO: Implement
        return "1h23m"
    }
}
