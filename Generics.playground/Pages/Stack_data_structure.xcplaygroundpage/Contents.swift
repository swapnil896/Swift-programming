import Foundation

struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
}

extension Stack {
    
    var topItem: Element? {
        return items.last
    }
}

var stackOfInts = Stack<Int>()
stackOfInts.push(1)
stackOfInts.push(2)
stackOfInts.push(3)

print(stackOfInts)

print(stackOfInts.topItem)

print(stackOfInts.pop() ?? -1)
