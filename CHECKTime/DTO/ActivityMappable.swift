import Foundation

struct ActivityMappable {
    func map(entity: ActivityCoreDataEntity) -> DayActivity {
        DayActivity(
            id: UUID(managedObjectID: entity.objectID) ?? UUID(),
            startDate: entity.start ?? Date(),
            endDate: entity.end,
            tag: TagMappable().map(entity: entity.tag) ?? .init(label: Activity.work.name, colorHex: Activity.work.color)
        )
    }
}
