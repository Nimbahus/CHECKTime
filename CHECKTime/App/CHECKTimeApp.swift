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
            NavigationStack {
                TabView {
                    TrackPageView(viewModel: .init())
                        .tabItem {
                            Label("Tracker", systemImage: "clock")
                        }
                    
                    CalendarView(calendarViewModel: CalendarViewModel(dayEntries: []))
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        .tabItem {
                            Label("Calendar", systemImage: "calendar")
                        }
                    
#if os(iOS)
                    SettingsView(viewModel: .init())
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
#endif
                }
                .onAppear {
                    // correct the transparency bug for Tab bars
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                    // correct the transparency bug for Navigation bars
                    let navigationBarAppearance = UINavigationBarAppearance()
                    navigationBarAppearance.configureWithOpaqueBackground()
                    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
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
