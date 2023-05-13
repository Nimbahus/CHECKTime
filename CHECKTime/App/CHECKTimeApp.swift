//
//  CHECKTimeApp.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import CoreData
import SwiftUI

@main
struct CHECKTimeApp: App {
    @StateObject var mainService: MainService = .init(persistenceController: PersistenceController.shared)

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

class MainService: ObservableObject {
    @Published var dayEntries: [DayEntry] = []
    @Published var tags: [Tag] = []
    
    let persistenceController: PersistenceController
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
        addRemoteChangeObserver()
        fetchAllDayEntries()
        fetchAllTags()
    }
    
    deinit {
        removeRemoteChangeObserver()
    }
    
    private func addRemoteChangeObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleRemoteChange),
            name: NSNotification.Name(rawValue: "NSPersistentStoreRemoteChangeNotification"),
            object: persistenceController.container.persistentStoreCoordinator
        )
    }
    
    private func removeRemoteChangeObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name(rawValue: "NSPersistentStoreRemoteChangeNotification"),
            object: persistenceController.container.persistentStoreCoordinator
        )
    }
    
    @objc
    private func handleRemoteChange() {
        fetchAllDayEntries()
        fetchAllTags()
    }
    
    func fetchAllDayEntries() {
        let fetchRequest = NSFetchRequest<DayCoreDataEntity>(entityName: "Day")
        let results = try? persistenceController.container.viewContext.fetch(fetchRequest)
        dayEntries = results?.compactMap { DayMappable().map(entity: $0) } ?? []
    }
    
    func addDayEntry(_ dayEntry: DayEntry) throws {
        dayEntries.append(dayEntry)
        
        let viewContext = persistenceController.container.viewContext
        let activityEntities = dayEntry.activities.map {
            let activityEntity = ActivityCoreDataEntity(context: viewContext)
            activityEntity.start = $0.startDate
            activityEntity.end = $0.endDate
            let tagEntity = TagCoreDataEntity(context: viewContext)
            tagEntity.label = $0.tag.activity.getStringValue()
            tagEntity.colorHex = $0.tag.colorHex ?? "#FFFFFF"
            activityEntity.tag = tagEntity
            return activityEntity
        }
        let dayEntity = DayCoreDataEntity(context: viewContext)
        dayEntity.activities = Set(activityEntities)
        
        try persistenceController.save()
    }
    
    func deleteDayEntry(_ dayEntry: DayEntry) throws {
        dayEntries.removeAll(where: { dayEntry.id == $0.id })
        guard
            let objectID = dayEntry.id.managedObjectID(in: persistenceController.container.persistentStoreCoordinator) else {
            // TODO: Handle error
            return
        }
        try persistenceController.delete(objectID)
    }
    
    func updateDayEntry(_ dayEntry: DayEntry) throws {
        try deleteDayEntry(dayEntry)
        try addDayEntry(dayEntry)
        fetchAllDayEntries()
    }
    
    func fetchAllTags() {
        let fetchRequest = NSFetchRequest<TagCoreDataEntity>(entityName: "Tag")
        let results = try? persistenceController.container.viewContext.fetch(fetchRequest)
        tags = results?.compactMap { TagMappable().map(entity: $0) } ?? []
    }
    
    func addNewTag(_ tag: Tag) throws {
        tags.append(tag)
        let entity = TagCoreDataEntity(context: persistenceController.container.viewContext)
        entity.label = tag.activity.getStringValue()
        entity.colorHex = tag.colorHex ?? "#FFFFFF"
        try persistenceController.save()
    }
    
    func deleteTag(_ tag: Tag) throws {
        tags.removeAll(where: { tag.id == $0.id })
        guard let objectID = tag.id.managedObjectID(in: persistenceController.container.persistentStoreCoordinator) else {
            // TODO: Handle error
            return
        }
        try persistenceController.delete(objectID)
    }
}
