//
//  TrackPageViewModel.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 13.05.23.
//

import SwiftUI

extension TrackPageView {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var color: Color = .blue
        @Published var timePerDayInSeconds = 60 * 60 * 8

        @Published var activities: [Activity] = [.work, .meeting, .dailyBreak, .custom(name: "Kicker", icon: nil)]
        
        @Published var timeTrackerViewModel: TimeTrackerViewModel?
        @Published var activityButtonMap: [Activity: ToggleButton.ViewModel] = [:]
        var mainService: MainService
        
        init(mainService: MainService) {
            self.mainService = mainService
        }
        
        func selectedTrackingActivity(activity: Activity) {
            activityButtonMap.forEach { (activity, viewModel) in
                viewModel.isActive = false
            }
            activityButtonMap[activity]?.isActive = true
            
//            let newActivity = DayActivity(startDate: Date(), tag: Tag.init(label: activity.name, colorHex: activity.color))
//            let newEntry = DayEntry(id: UUID(), activities: [newActivity])
//            try! mainService.addDayEntry(newEntry)
            
        }
    }
}
