//
//  TrackPageView.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 13.05.23.
//

import SwiftUI

struct TrackPageView: View {
    
    @StateObject var viewModel: ViewModel
    @State var stopButtonActive = true // always true
    
    var body: some View {
        VStack {
            if let timeTrackerViewModel = viewModel.timeTrackerViewModel {
                TimeTrackerView(model: timeTrackerViewModel)
            }
            List {
				Button("Stop") {
                    
                }
                .buttonStyle(StandardButtonStyle(isActive: $stopButtonActive, color: .black))
                ForEach(viewModel.activities, id: \.id) { activity in
                    if let viewModel = viewModel.activityButtonMap[activity] {
                        ToggleButton(viewModel: viewModel)
                            .listRowSeparator(.hidden)
                    }
               }
            }
            .listStyle(PlainListStyle())
        }
    }
    
    init(viewModel: ViewModel, mainService: MainService) {
        _viewModel = StateObject(wrappedValue: viewModel)
        viewModel.timeTrackerViewModel = .init(maxSeconds: viewModel.timePerDayInSeconds)
        

        viewModel.activities.forEach { activity in
            let buttonViewModel = ToggleButton.ViewModel(title: activity.name,
                                                         iconName: activity.iconName,
                                                         isActive: false,
                                                         color: Color(hex: activity.color) ?? .blue)
            buttonViewModel.action = {
                viewModel.timeTrackerViewModel?.progressBarColor = Color(hex: activity.color) ?? .blue
                viewModel.selectedTrackingActivity(activity: activity)
            }
            
            viewModel.activityButtonMap[activity] = buttonViewModel
        }
        
    }
}

struct TrackPageView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyMainService = MainService(persistenceController: .shared)
        let viewModel = TrackPageView.ViewModel(mainService: dummyMainService)
        return TrackPageView(viewModel: viewModel, mainService: dummyMainService)
    }
}
