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
    case custom(name: String, icon: String?)
    
    var name: String {
        
        switch self {
        case .meeting:
            return "Meeting"
        case .dailyBreak:
            return "Break"
        case .work:
            return "Work"
        case .custom(let name, _):
            return name
        }
    }
    
    var iconName: String {
        
        switch self {
        case .meeting:
            return "person.3.sequence.fill"
        case .dailyBreak:
            return "cup.and.saucer.fill"
        case .work:
            return "desktopcomputer"
        case .custom(_, let icon):
            return icon ?? "questionmark.circle.fill"
        }
    }
}
