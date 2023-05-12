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
        Button(viewModel.title) {
            viewModel.action?()
        }
    }
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButton(viewModel: .init())
    }
}
