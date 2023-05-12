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
        
        @Published var hoursPerWeek = 40
        @Published var showTimerForIndividualCategories = true
        
    }
    
}
