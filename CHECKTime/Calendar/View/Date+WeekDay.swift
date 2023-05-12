//
//  Date+WeekDay.swift
//  CHECKTime
//
//  Created by David Schmöker on 12.05.23.
//

import Foundation

extension Date {
    func weekDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self).capitalized
    }
}
