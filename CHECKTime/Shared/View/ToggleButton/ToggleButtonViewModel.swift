//
//  ToggleButton.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

extension ToggleButton {
    
    @MainActor
    class ViewModel: ObservableObject {
        
        @Published var title: String
        @Published var iconName: String?
        @Published var isActive: Bool
        @Published var color: Color
        @Published var startDate: Date?
        @Published var additionalTimeInSeconds: Int?
        @Published var action: (() -> Void)?
        
        init(title: String,
             iconName: String?,
             isActive: Bool,
             color: Color,
             startDate: Date? = nil,
             additionalTimeInSeconds: Int? = nil,
             action: (() -> Void)? = nil) {

            self.title = title
            self.iconName = iconName
            self.isActive = isActive
            self.color = color
            self.startDate = startDate
            self.additionalTimeInSeconds = additionalTimeInSeconds
            self.action = { [weak self] in
                self?.isActive.toggle()
                action?()
            }
        }
        
        convenience init(isActive: Bool, startDate: Date? = nil) {
            self.init(title: "Test", iconName: "clock", isActive: isActive, color: .red, startDate: startDate)
        }
        
    }
}
