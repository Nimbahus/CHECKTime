import CoreData

class DayCoreDataEntity: NSManagedObject {
    @NSManaged var date: Date?
    @NSManaged var goal: NSNumber?
    @NSManaged var activities: Set<ActivityCoreDataEntity>?
}
