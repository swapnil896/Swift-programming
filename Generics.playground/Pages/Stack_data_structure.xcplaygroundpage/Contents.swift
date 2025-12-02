import Foundation

struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    // Removes the top item from stack and returns it
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
    // Just returns the last element, without removing it
    mutating func peek() -> Element? {
        items.last
    }
    
    mutating func clear() {
        items.removeAll()
    }
}

extension Stack where Element: Comparable {
    
    var topItem: Element? {
        return items.last
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    func max() -> Element? {
        items.max()
    }
    
    func min() -> Element? {
        items.min()
    }
}

var stackOfInts = Stack<Int>()
stackOfInts.push(1)
stackOfInts.push(2)
stackOfInts.push(3)

print(stackOfInts)

print(stackOfInts.topItem)

print(stackOfInts.pop() ?? -1)
print(stackOfInts.isEmpty)
print(stackOfInts.max())
print(stackOfInts.min())

stackOfInts.clear()
print(stackOfInts)
