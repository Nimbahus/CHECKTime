import Foundation

struct DayMappable {
    func map(entity: DayCoreDataEntity?) -> DayEntry? {
        guard let entity,
              let activities = entity.activities else {
            return nil
        }
        return DayEntry(
            id: UUID(managedObjectID: entity.objectID) ?? UUID(),
            activities: activities.compactMap { ActivityMappable().map(entity: $0) }
        )
    }
}
