//
//  CHECKTimeAppiOS.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 13.05.23.
//

import SwiftUI

#if os(iOS)
    struct CHECKTimeAppiOS: View {
        var body: some View {
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
                    SettingsView(viewModel: .init())
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
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
    }

    struct CHECKTimeAppiOS_Previews: PreviewProvider {
        static var previews: some View {
            CHECKTimeAppiOS()
        }
    }
#endif
