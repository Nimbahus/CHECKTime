//
//  CalendarViewModel.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

@MainActor
final class CalendarViewModel: ObservableObject {
    var dayEntries: [DayEntry]
    
    init(dayEntries: [DayEntry]) {
        self.dayEntries = DayEntryMock.dayEntries
    }
}
