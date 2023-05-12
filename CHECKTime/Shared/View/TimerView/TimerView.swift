//
//  TimerView.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        if let timerText = viewModel.timerText {
            Text(timerText)
                .font(.largeTitle)
                .bold()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewModel: .init(startDate: Date()))
    }
}
