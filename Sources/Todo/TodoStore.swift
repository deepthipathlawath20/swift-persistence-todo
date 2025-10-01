import Foundation

public protocol TodoStoring {
    func create(_ item: TodoItem)
    func all() -> [TodoItem]
    func update(_ item: TodoItem)
    func delete(id: UUID)
    func find(id: UUID) -> TodoItem?
}

public final class InMemoryTodoStore: TodoStoring {
    private var items: [UUID: TodoItem] = [:]

    public init() {}

    public func create(_ item: TodoItem) { items[item.id] = item }
    public func all() -> [TodoItem] { items.values.sorted { $0.createdAt < $1.createdAt } }
    public func update(_ item: TodoItem) { items[item.id] = item }
    public func delete(id: UUID) { items[id] = nil }
    public func find(id: UUID) -> TodoItem? { items[id] }
}
