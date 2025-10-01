import Foundation

public final class TodoController {
    private let store: TodoStoring

    public init(store: TodoStoring) { self.store = store }

    @discardableResult
    public func add(title: String) -> TodoItem {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let item = TodoItem(title: trimmed)
        store.create(item)
        return item
    }

    public func toggle(id: UUID) {
        guard var item = store.find(id: id) else { return }
        item.isDone.toggle()
        store.update(item)
    }

    public func remove(id: UUID) { store.delete(id: id) }
    public func list() -> [TodoItem] { store.all() }
}
