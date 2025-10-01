import Foundation

public struct TodoItem: Equatable, Identifiable {
    public let id: UUID
    public var title: String
    public var isDone: Bool
    public var createdAt: Date

    public init(id: UUID = UUID(), title: String, isDone: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }
}

public extension TodoItem {
    var displayLine: String { "[\(isDone ? "x" : " ")] \(title)" }
}
