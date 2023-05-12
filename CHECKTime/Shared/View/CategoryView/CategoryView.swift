//
//  CategoryView.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            TimerView(viewModel: .init(startDate: Date()))
            ToggleButton(viewModel: .init(title: viewModel.title, iconName: viewModel.iconName, isActive: viewModel.isActive, color: viewModel.color))
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: .init(isActive: true, color: .red, title: "test"))
    }
}
