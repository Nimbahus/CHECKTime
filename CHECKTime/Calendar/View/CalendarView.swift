//
//  CalendarView.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Charts
import SwiftUI

struct CalendarView: View {
    @StateObject private var calendarViewModel: CalendarViewModel
    
    var body: some View {
        Chart {
            ForEach(calendarViewModel.dayEntries) { dayEntry in
                ForEach(Array(zip(dayEntry.activities.indices, dayEntry.activities)), id: \.0) { _, activity in
                    BarMark(
                        x: .value("Wochentag", dayEntry.activities[0].startDate),
                        yStart: .value(
                            "",
                            dif(lhs: dayEntry.activities[0], rhs: activity)
                        ),
                        yEnd: .value("", int(activity: activity))
                    )
                    .foregroundStyle(activity.color == "work" ? .blue : .red)
                }
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .day)) { _ in
                AxisGridLine().foregroundStyle(.orange)
                AxisValueLabel(
                    format: .dateTime.weekday(),
                    centered: true
                )
            }
        }
        .padding()
    }
    
    init(calendarViewModel: CalendarViewModel) {
        _calendarViewModel = StateObject(wrappedValue: calendarViewModel)
    }

    func dif(lhs: DayActivity, rhs: DayActivity) -> TimeInterval {
        return (lhs.startDate.timeIntervalSinceReferenceDate - rhs.startDate.timeIntervalSinceReferenceDate) / 3600
    }
    
    func int(activity: DayActivity) -> TimeInterval {
        return (activity.endDate.timeIntervalSinceReferenceDate - activity.startDate.timeIntervalSinceReferenceDate) / 3600
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(calendarViewModel: CalendarViewModel(dayEntries: DayEntryMock.dayEntries))
    }
}
