//
//  Activity.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

enum Activity: Identifiable, Hashable {
    var id: String {
        switch self {
        
        case .meeting:
            return "meeting"
        case .dailyBreak:
            return "dailyBreak"
        case .work:
            return "work"
        case .custom(let name, _):
            return name
        }
    }
    
    case meeting
    case dailyBreak
    case work
    case custom(name: String, icon: String?)
    
    var color: String {
        switch self {
            case .work:
                return "#16366F"
            case .meeting:
                return "#F4C430"
            case .dailyBreak:
                return "#740000"
            case .custom:
                return ""
        }
    }
    
    var name: String {
        switch self {
            case .meeting:
                return "Meeting"
            case .dailyBreak:
                return "Break"
            case .work:
                return "Work"
            case let .custom(name, _):
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
            case let .custom(_, icon):
                return icon ?? "questionmark.circle.fill"
        }
    }
}

// TODO: Communicate this update w/ frontend
struct Tag: Identifiable, Hashable {
    var id: UUID
    var activity: Activity
    let colorHex: String?
    
    init(
        id: UUID = UUID(),
        label: String?,
        colorHex: String?
    ) {
        self.id = id
        self.colorHex = colorHex
        self.activity = .work
    }
    
    private func labelToWorkType(label: String?) -> Activity {
        guard let label else {
            return .meeting
        }
        switch label {
            case "meeting":
                return .meeting
            
            case "dailyBreak":
                return .dailyBreak
            
            case "work":
                return .work
            
            default:
                return .custom(name: label, icon: nil)
        }
    }
}

extension Activity {
    func getStringValue() -> String {
        switch self {
            case .meeting:
                return "meeting"
            
            case .dailyBreak:
                return "dailyBreak"
            
            case .work:
                return "work"
            
            case let .custom(name, _):
                return name
        }
    }
}
