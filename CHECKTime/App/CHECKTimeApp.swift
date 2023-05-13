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
                TabView {
                    TrackPageView(viewModel: .init())
                        .tabItem {
                            Label("Tracker", systemImage: "clock")
                        }
                    
                    CalendarView(calendarViewModel: CalendarViewModel(dayEntries: []))
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        .tabItem {
                            Label("Kalender", systemImage: "calendar")
                        }
                    
                    #if os(iOS)
                    SettingsView(viewModel: .init())
                        .tabItem {
                            Label("Einstellungen", systemImage: "gear")
                        }
                    #endif
                }
            }
        }
#if os(macOS)
        Settings {
            SettingsView(viewModel: .init())
        }
#endif
    }
}
