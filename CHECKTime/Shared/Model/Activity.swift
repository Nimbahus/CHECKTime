//
//  Activity.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

enum Activity {
    case meeting
    case dailyBreak
    case work
    case custom(String)
    
    var name: String {
        switch self {
        case .meeting:
            return "Meeting"
        case .dailyBreak:
            return "Pause"
        case .work:
            return "Arbeiten"
        case .custom(let text):
            return text
        }
    }
    
    var iconName: String? {
        switch self {
        case .dailyBreak:
            return "moon.fill"
        default:
            return nil
        }
    }
}
