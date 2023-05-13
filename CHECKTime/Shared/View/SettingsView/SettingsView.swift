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
            Section("General") {
                TextField("Hours per week", value: $viewModel.hoursPerWeek, formatter: NumberFormatter())
                    #if os(iOS)
                    .keyboardType(.numberPad)
                    #endif
                ColorPicker("Color", selection: $viewModel.color)
            }
        }
        #if os(macOS)
        .padding()
        #endif
    }
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init())
    }
}
