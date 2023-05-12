//
//  CHECKTimeApp.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import SwiftUI

@main
struct CHECKTimeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                CalendarView(calendarViewModel: CalendarViewModel(dayEntries: []))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
        #if os(macOS)
        Settings {
            SettingsView(viewModel: .init())
        }
        #endif
    }
}
