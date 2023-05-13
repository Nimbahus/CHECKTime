import CoreData

class ActivityCoreDataEntity: NSManagedObject {
    @NSManaged var start: Date?
    @NSManaged var end: Date?
    @NSManaged var tag: TagCoreDataEntity?
}
