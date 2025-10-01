import Foundation

let controller = TodoController(store: InMemoryTodoStore())
let a = controller.add(title: "Buy groceries")
let b = controller.add(title: "Study Swift")

controller.toggle(id: a.id)

print("All:")
for item in controller.list() {
    print(item.displayLine)
}
