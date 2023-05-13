//
//  Date+Extensions.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import Foundation

extension Date {
    
    func numberOfSecondsBetween(_ date: Date) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        let components = calendar.dateComponents([.second], from: self, to: date)
        return components.second ?? 0
    }
}
