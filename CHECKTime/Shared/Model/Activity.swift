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
        
    var label: WorkType?
    let colorHex: String?
    
    init(label: String?, colorHex: String?) {
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
