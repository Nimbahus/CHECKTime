import Foundation

struct TagMappable {
    func map(entity: TagCoreDataEntity?) -> Tag? {
        guard let entity else {
            return nil
        }
        return Tag(
            id: UUID(managedObjectID: entity.objectID) ?? UUID(),
            label: entity.label,
            colorHex: entity.colorHex
        )
    }
}
