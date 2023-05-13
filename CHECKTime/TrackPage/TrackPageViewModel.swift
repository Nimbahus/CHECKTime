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
        @Published var activities: [Activity] = [.work, .meeting, .dailyBreak, .custom(name: "Kicker", icon: nil, color: "#FFFFFF")]
    }
}
