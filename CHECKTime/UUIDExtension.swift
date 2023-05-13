import Foundation
import CoreData

extension UUID {
    init?(managedObjectID: NSManagedObjectID) {
        guard let uuid = UUID(uuidString: managedObjectID.uriRepresentation().absoluteString) else {
            return nil
        }
        self = uuid
    }
    
    func managedObjectID(in coordinator: NSPersistentStoreCoordinator) -> NSManagedObjectID? {
        guard let url = URL(string: self.uuidString) else {
            return nil
        }
        return coordinator.managedObjectID(forURIRepresentation: url)
    }
}
