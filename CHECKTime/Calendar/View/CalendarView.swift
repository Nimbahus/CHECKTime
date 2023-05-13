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
                ForEach(calendarViewModel.dayEntries) { dayEntry in
                    ForEach(Array(zip(dayEntry.activities.indices, dayEntry.activities)), id: \.0) { _, activity in
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
                        .annotation(position: .overlay, alignment: .top) {
                            Text(activity.endDate.formatted(date: .omitted, time: .shortened))
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .foregroundStyle(Color(hex: activity.color) ?? .blue)
                    }
                }
            }
        }
    }

    init(calendarViewModel: CalendarViewModel) {
        _calendarViewModel = StateObject(wrappedValue: calendarViewModel)
    }

    func start(activity: DayActivity, firstActivity: DayActivity) -> TimeInterval {
        return abs((activity.startDate.timeIntervalSinceReferenceDate - firstActivity.startDate.timeIntervalSinceReferenceDate) / 3600)
    }

    func end(activity: DayActivity, firstActivity: DayActivity) -> TimeInterval {
        return abs(activity.endDate - firstActivity.startDate) / 3600
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(calendarViewModel: CalendarViewModel(dayEntries: [
            DayEntry(activities: [
                DayActivity(startDate: Date.now, endDate: Date.now.addingTimeInterval(10000), color: "#00000", activityType: .work),
            ]),
        ]))
    }
}
