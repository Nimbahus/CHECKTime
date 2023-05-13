struct ActivityMappable {
    func map(entity: ActivityCoreDataEntity) -> DayActivity {
        DayActivity(
            startDate: entity.start,
            endDate: entity.end,
            tag: TagMappable().map(entity: entity.tag)
        )
    }
}
