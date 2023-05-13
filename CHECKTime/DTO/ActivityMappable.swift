import Foundation

struct ActivityMappable {
    func map(entity: ActivityCoreDataEntity) -> DayActivity {
        DayActivity(
            id: UUID(managedObjectID: entity.objectID) ?? UUID(),
            startDate: entity.start,
            endDate: entity.end,
            tag: TagMappable().map(entity: entity.tag)
        )
    }
}
