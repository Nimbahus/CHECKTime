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
    @Published var selectedTimeFrame: TimeFrame
    
    init(dayEntries: [DayEntry]) {
        self.dayEntries = DayEntryMock.dayEntries
        self.selectedTimeFrame = .week
    }
    
    func dayEntries(for timeFrame: TimeFrame) -> [DayEntry] {
        let matchingEntries = dayEntries.filter {
            guard let entryDate = $0.date else {
                return false
            }
            
            guard let minDate = timeFrame.minDate else {
                return true
            }
            
            return entryDate > minDate
        }
        
        let result = addMissingDays(for: timeFrame, to: matchingEntries)
        return result
    }
    
    private func addMissingDays(for timeFrame: TimeFrame, to entries: [DayEntry]) -> [DayEntry] {
        switch timeFrame {
            case .week: return addMissingDaysInWeek(to: entries)
            case .month: return addMissingDaysInMonth(to: entries)
        }
    }
    
    private func addMissingDaysInWeek(to entries: [DayEntry]) -> [DayEntry] {
        guard let startOfWeek = Date().startOfWeek(using: Calendar.current) else {
            return []
        }
        
        var result: [DayEntry] = []
        weekLoop: for i in 0...4 {
            guard let weekDay = Calendar.current.date(byAdding: .day, value: i, to: startOfWeek) else {
                continue
            }
            
            for entry in entries {
                guard let entryDate = entry.date else {
                    continue
                }
                if Calendar.current.isDate(entryDate, inSameDayAs: weekDay) {
                    result.append(entry)
                    continue weekLoop
                }
            }
            result.append(
                DayEntry(
                    id: UUID(),
                    activities: [
                        DayActivity(startDate: weekDay, endDate: weekDay, tag: Tag(label: Activity.dailyBreak.name, colorHex: Activity.dailyBreak.color)),
                    ]
                ))
        }
        
        return result
    }
    
    private func addMissingDaysInMonth(to entries: [DayEntry]) -> [DayEntry] {
        // TODO: implement
        return entries
    }
}
