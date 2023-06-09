//
//  Persistence.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        self.container = NSPersistentCloudKitContainer(name: "CHECKTime")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        let remoteChangeKey = "NSPersistentStoreRemoteChangeNotificationOptionKey"
        container.persistentStoreDescriptions.first?.setOption(true as NSNumber, forKey: remoteChangeKey)
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save() throws {
        let context = container.viewContext
        if context.hasChanges {
            try context.save()
        }
    }
    
    func delete(_ id: NSManagedObjectID) throws {
        let context = container.viewContext
        let object = context.object(with: id)
        context.delete(object)
        try save()
    }
    
    func update(_ id: NSManagedObjectID) throws {
        let context = container.viewContext
        let object = context.object(with: id)
        
        try save()
    }
}
