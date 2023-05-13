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
            #if os(iOS)
                CHECKTimeAppiOS()
            #endif
            #if os(macOS)
                CHECKTimeAppmacOS()
                    .frame(minWidth: 1000, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
            #endif
        }
        #if os(macOS)
            Settings {
                SettingsView(viewModel: .init())
            }
        #endif
    }
}
