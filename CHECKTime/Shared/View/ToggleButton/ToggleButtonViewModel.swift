//
//  ToggleButton.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import Foundation

extension ToggleButton {
    
    @MainActor
    class ViewModel: ObservableObject {
        
        @Published var title: String = "Test"
        @Published var action: (() -> Void)? = {
            print("test")
        }
        
    }
    
}
