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
        @Published var action: (() -> Void)?
        
        init(title: String, iconName: String?, isActive: Bool, color: Color) {
            self.title = title
            self.iconName = iconName
            self.isActive = isActive
            self.color = color
            self.action = {
                self.isActive.toggle()
            }
        }
        
        convenience init(isActive: Bool) {
            self.init(title: "Test", iconName: "clock", isActive: isActive, color: .red)
        }
        
    }
    
}
