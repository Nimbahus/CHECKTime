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
        GroupBox("CHECKTime of the Week") {
            Chart {
                ForEach(DayEntryMock.dayEntries, id: \.self) { dayEntry in
                    ForEach(dayEntry.activities, id: \.self) { activity in
                        let firstActivity = dayEntry.activities.first!
                        BarMark(
                            x: .value("Weekday", dayEntry.activities[0].startDate.weekDay()),
                            yStart: .value(
                                "StartDate",
                                start(activity: activity, firstActivity: firstActivity)
                            ),
                            yEnd: .value(
                                "EndDate",
                                end(
                                    activity: activity,
                                    firstActivity: firstActivity
                                )
                            ),
                            width: 50
                        )
                        .foregroundStyle(Color(hex: activity.tag.activity.color) ?? .blue)
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartYAxisLabel("Hours")
            
            if let dayForActivitiesListView {
                ActivitiesListView(viewModel: ActivityListViewModel(activities: dayForActivitiesListView.activities))
            }
        }
    }

    var dayForActivitiesListView: DayEntry? {
            calendarViewModel.dayEntries.first { dayEntry in
                guard let date =  dayEntry.date else { return false }
                return Calendar.current.isDateInToday(date)
            } ?? calendarViewModel.dayEntries.last
        }

    
    init(calendarViewModel: CalendarViewModel) {
        _calendarViewModel = StateObject(wrappedValue: calendarViewModel)
    }

    func start(activity: DayActivity, firstActivity: DayActivity) -> TimeInterval {
        return abs((activity.startDate.timeIntervalSinceReferenceDate - firstActivity.startDate.timeIntervalSinceReferenceDate) / 3600)
    }

    func end(activity: DayActivity, firstActivity: DayActivity) -> TimeInterval {
        return abs((activity.endDate ?? Date.now) - firstActivity.startDate) / 3600
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(calendarViewModel: CalendarViewModel(dayEntries: DayEntryMock.dayEntries))
    }
}
