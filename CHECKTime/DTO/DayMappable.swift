struct DayMappable {
    func map(entity: DayCoreDataEntity?) -> DayEntry? {
        guard let entity,
              let activities = entity.activities else {
            return nil
        }
        return DayEntry(
            activities: activities.compactMap { ActivityMappable().map(entity: $0) }
        )
    }
}
