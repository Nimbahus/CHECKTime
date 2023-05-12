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
            HStack {
                if let iconName = viewModel.iconName {
                    Image(systemName: iconName)
                }
                Text(viewModel.title)
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
            ToggleButton(viewModel: .init(isActive: true))
            ToggleButton(viewModel: .init(isActive: false))
        }
    }
}
