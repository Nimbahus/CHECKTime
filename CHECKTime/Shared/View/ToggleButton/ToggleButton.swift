//
//  ToggleButton.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

struct ToggleButton: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        Button(action: {
            viewModel.action?()
        }) {
            VStack {
                HStack {
                    if let iconName = viewModel.iconName {
                        Image(systemName: iconName)
                    }
                    Text(viewModel.title)
                }
                if let startDate = viewModel.startDate {
                    TimerView(viewModel: .init(startDate: startDate, isPaused: !viewModel.isActive))
                }
            }
        }
        .buttonStyle(StandardButtonStyle(isActive: $viewModel.isActive, color: viewModel.color))
    }
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ToggleButton(viewModel: .init(isActive: false, startDate: Date()))
            ToggleButton(viewModel: .init(isActive: false))
        }
    }
}
