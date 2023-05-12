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
    @Environment(\.scenePhase) var schenePhase

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
        .onChange(of: ScenePhase) { newValue in
            persistenceController.save()
        }
    }
}
