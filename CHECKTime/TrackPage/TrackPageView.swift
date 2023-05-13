//
//  TrackPageView.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 13.05.23.
//

import SwiftUI

struct TrackPageView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            TimeTrackerView(model: .init(maxSeconds: viewModel.timePerDayInSeconds))
            List {
                ForEach(viewModel.activities, id: \.name) { activity in
                    ToggleButton(viewModel: .init(title: activity.name, iconName: activity.iconName, isActive: false, color: viewModel.color))
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct TrackPageView_Previews: PreviewProvider {
    static var previews: some View {
        TrackPageView(viewModel: .init())
    }
}
