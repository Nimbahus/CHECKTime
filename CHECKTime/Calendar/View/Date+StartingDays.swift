//
//  Date+StartingDays.swift
//  CHECKTime
//
//  Created by David Schmöker on 13.05.23.
//

import Foundation

extension Date {
    func startOfWeek(using calendar: Calendar) -> Date? {
        calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date
    }
    
    func startOfMonth(using calendar: Calendar) -> Date? {
        calendar.dateComponents([.calendar, .month], from: self).date
    }
}
