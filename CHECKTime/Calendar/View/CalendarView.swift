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
            BarMark(x: .value("Start", 0), yStart: .value("Y-Start", 5), yEnd: .value("Y-End", 10))
        }
    }
    
    init(calendarViewModel: CalendarViewModel) {
        _calendarViewModel = StateObject(wrappedValue: calendarViewModel)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(calendarViewModel: CalendarViewModel(activities: [DayActivity(startDate: Date.now, endDate: Date.now.addingTimeInterval(10000), color: "#00000")]))
    }
}


