//
//  CHECKTimeAppmacOS.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 13.05.23.
//

import SwiftUI

#if os(macOS)
    struct CHECKTimeAppmacOS: View {
        var body: some View {
            HStack {
                TrackPageView(viewModel: .init())
            
                CalendarView(calendarViewModel: CalendarViewModel(dayEntries: []))
            }
        }
    }

    struct CHECKTimeAppmacOS_Previews: PreviewProvider {
        static var previews: some View {
            CHECKTimeAppmacOS()
        }
    }
#endif
