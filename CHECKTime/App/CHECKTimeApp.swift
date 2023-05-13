//
//  CHECKTimeApp.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import SwiftUI
import Combine
import CoreData

@main
struct CHECKTimeApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var mainService: MainService = MainService(persistenceController: PersistenceController.shared)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CalendarView(calendarViewModel: CalendarViewModel(activities: []))
                    .environmentObject(mainService)
            }
        }
    }
}


class MainService: ObservableObject {
    @Published var dayEntries: [DayEntry] = []
    @Published var tags: [Tag] = []
    let persistenceController: PersistenceController
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
        self.dayEntries = getAllDayEntries()
        self.tags = getAllTags()
    }
    
    func getAllDayEntries() -> [DayEntry] {
        let fetchRequest = NSFetchRequest<DayCoreDataEntity>(entityName: "CHECKTime")
        let results = try? persistenceController.container.viewContext.fetch(fetchRequest)
        return results?.compactMap { DayMappable().map(entity: $0) } ?? []
    }
    
    func getAllTags() -> [Tag] {
        let fetchRequest = NSFetchRequest<TagCoreDataEntity>(entityName: "CHECKTime")
        let results = try? persistenceController.container.viewContext.fetch(fetchRequest)
        return results?.compactMap { TagMappable().map(entity: $0) } ?? []
    }
    
    func saveNewTag(tag: Tag) {
        tags.append(tag)
        // TODO: Implement
    }
    
    // TODO: Other CRUD operations
    
    
    // TODO: Obsolete
//    @Published var activities: Double?
//    @Published var items: FetchedResults<DayCoreDataEntity>?
//
//    var cancellables = Set<AnyCancellable>()
//
//    init(items: FetchedResults<DayCoreDataEntity>?) {
//        self.items = items
//        subscribeToActivitiesChanges()
//        subscribeToCoreDataChanges()
//    }
//
//    private func subscribeToActivitiesChanges() {
//        $activities
//            .sink { _ in
//
//            }
//            .store(in: &cancellables)
//
//    }
//
//    private func subscribeToCoreDataChanges() {
//        $items
//            .sink { _ in
//
//            }
//            .store(in: &cancellables)
//
//    }
}
