//
//  CategoryViewMode.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

extension CategoryView {
    
    @MainActor
    class ViewModel: ObservableObject {
        
        @Published var isActive: Bool
        @Published var color: Color
        @Published var title: String
        @Published var iconName: String?
        
        init(isActive: Bool, color: Color, title: String, iconName: String? = nil) {
            self.isActive = isActive
            self.color = color
            self.title = title
            self.iconName = iconName
        }
        
    }
    
}
