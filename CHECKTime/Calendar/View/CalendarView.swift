//
//  CalendarView.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import SwiftUI
import Charts

struct CalendarView: View {
    @StateObject private var calendarViewModel: CalendarViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    init(calendarViewModel: CalendarViewModel) {
        _calendarViewModel = StateObject(wrappedValue: calendarViewModel)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(calendarViewModel: CalendarViewModel(activities: [DailyActivity(startDate: Date.now, endDate: Date.now.addingTimeInterval(10000))]))
    }
}
