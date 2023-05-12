//
//  TimeTrackerViewModel.swift
//  CHECKTime
//
//  Created by Maurizio Volanti on 12.05.23.
//

import SwiftUI

protocol TimeTrackerViewDelegate: AnyObject {
    func didStartTimer(currentSeconds: Int)
    func didPauseTimer(currentSeconds: Int)
}

class TimeTrackerViewModel: ObservableObject, Identifiable {
    @Published var maxSeconds: Int
    @Published var currentSeconds: Int
    @Published var maxTimeAvailable: Bool
    @Published var progressBarColor: Color = .pink
    @Published var delegate: TimeTrackerViewDelegate?

    init(maxSeconds: Int, currentSeconds: Int = 0, delegate: TimeTrackerViewDelegate? = nil) {
        self.maxSeconds = maxSeconds
        self.currentSeconds = currentSeconds
        self.delegate = delegate
        self.maxTimeAvailable = maxSeconds != 0
    }
    
    func updateColor(color: Color) {
        self.progressBarColor = color
    }
}
