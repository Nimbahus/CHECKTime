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
}


// TODO: Communicate this update w/ frontend
struct Tag {
    enum WorkType {
        case meeting
        case dailyBreak
        case work
        case custom(String)
    }
    
    let id: UUID
    var label: WorkType?
    let colorHex: String?
    
    init(
        id: UUID,
        label: String?,
        colorHex: String?
    ) {
        self.id = id
        self.colorHex = colorHex
        self.label = labelToWorkType(label: label)
    }
    
    private func labelToWorkType(label: String?) -> WorkType? {
        guard let label else {
            return nil
        }
        switch label {
        case "meeting":
            return .meeting
            
        case "dailyBreak":
            return .dailyBreak
            
        case "work":
            return .work
            
        default:
            return .custom(label)
        }
    }
}

extension Tag.WorkType {
    func getStringValue() -> String {
        switch self {
        case .meeting:
            return "meeting"
            
        case .dailyBreak:
            return "dailyBreak"
            
        case .work:
            return "work"
            
        case .custom(let string):
            return string
        }
    }
}
