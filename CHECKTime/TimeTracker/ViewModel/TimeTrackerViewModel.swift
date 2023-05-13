//
//  TimeTrackerViewModel.swift
//  CHECKTime
//
//  Created by Maurizio Volanti on 12.05.23.
//

import SwiftUI

protocol TimeTrackerViewDelegate: AnyObject {
    func didStartTimer(timestamp: Date)
    func didPauseTimer(timestamp: Date)
}

class TimeTrackerViewModel: ObservableObject, Identifiable {
    @Published var maxSeconds: Int
    @Published var progressBarColor: Color = .pink
    @Published var delegate: TimeTrackerViewDelegate?

    init(maxSeconds: Int, delegate: TimeTrackerViewDelegate? = nil) {
        self.maxSeconds = maxSeconds
        self.delegate = delegate
    }
    
    func updateColor(color: Color) {
        self.progressBarColor = color
    }
}
