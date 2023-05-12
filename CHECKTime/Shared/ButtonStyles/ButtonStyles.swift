//
//  ButtonStyles.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

struct StandardButtonStyle: ButtonStyle {
    
    @Binding var isActive: Bool
    var color: Color
    
    private let cornerRadius: CGFloat = 12.0
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.title.bold())
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(isActive ? .white : color)
            .background(isActive ? color : .clear)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(isActive ? .clear : color, lineWidth: 2)
            )
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
    
}
