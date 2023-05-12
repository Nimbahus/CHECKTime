//
//  TimerViewModelk.swift
//  CHECKTime
//
//  Created by Jakob Schwerter on 12.05.23.
//

import Foundation

extension TimerView {
    
   @MainActor
    class ViewModel: ObservableObject {
        
        @Published var timerText: String?
        @Published var startDate: Date
        @Published var additionalTimeInSeconds: Int?
        @Published var isPaused: Bool = false
        @Published var pausedSeconds: Int = 0
        
        private var timer: Timer?
        
        init(startDate: Date, isPaused: Bool = false, additionalTimeInSeconds: Int? = nil) {
            self.timerText = nil
            self.startDate = startDate
            self.isPaused = isPaused
            self.additionalTimeInSeconds = additionalTimeInSeconds
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
                self?.updateTimer()
            })
        }
        
        func updateTimer() {
            if isPaused {
                pausedSeconds += 1
                return
            }
            timerText = prettyPrintSecondsLeft(seconds: getPassedSeconds())
        }
        
        func getPassedSeconds() -> Int {
            startDate.numberOfSecondsBetween(Date()) + (additionalTimeInSeconds ?? 0) - pausedSeconds
        }

        private func prettyPrintSecondsLeft(seconds: Int) -> String {
            let hour = seconds / 3600
            let minute = seconds / 60 % 60
            let second = seconds % 60

            return String(format: "%02i:%02i:%02i", hour, minute, second)
        }
    }
}
