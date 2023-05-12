//
//  Date+Subtraction.swift
//  CHECKTime
//
//  Created by David Schmöker on 12.05.23.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
