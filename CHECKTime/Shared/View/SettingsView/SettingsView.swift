//
//  SettingsView.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Form {
            Section("Allgemein") {
                TextField("Stunden pro Woche", value: $viewModel.hoursPerWeek, formatter: NumberFormatter())
                    #if os(iOS)
                    .keyboardType(.numberPad)
                    #endif
                Toggle("Timer für einzelne Kategorien anzeigen", isOn: $viewModel.showTimerForIndividualCategories)
            }
            
        }
        #if os(macOS)
        .padding()
        #endif
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
