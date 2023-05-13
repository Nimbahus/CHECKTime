//
//  SettingsViewModel.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

extension SettingsView {
    
    @MainActor
    class ViewModel: ObservableObject {
        
        @Published var hoursPerWeek: Int
        @Published var color: Color
        
        init(hoursPerWeek: Int = 40, color: Color = .blue) {
            self.hoursPerWeek = hoursPerWeek
            self.color = color
        }
        
    }
    
}
