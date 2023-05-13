//
//  TimeFrame.swift
//  CHECKTime
//
//  Created by David Schmöker on 13.05.23.
//

import Foundation

enum TimeFrame: String, Identifiable, CaseIterable {
    case week
    case month
    
    var id: TimeFrame { self }
    
    var minDate: Date? {
        switch self {
            
        case .week:
            return Date().startOfWeek(using: Calendar.current)
            
        case .month:
            return Date().startOfMonth(using: Calendar.current)
        }
    }
}
