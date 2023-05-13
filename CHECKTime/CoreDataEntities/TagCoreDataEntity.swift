import CoreData

class TagCoreDataEntity: NSManagedObject {
    @NSManaged var colorHex: String?
    @NSManaged var label: String?
}
