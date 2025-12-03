import Foundation

// Associated types in Swift are placeholder types used inside a protocol.
// They let a protocol define requirements that depend on some unknown type, which will be specified later by the conforming type.

// Think of them as generics for protocols.
// Associated types are specified with the associatedtype keyword.

protocol Container {
    associatedtype Item
    
    mutating func add(_ item: Item)
    func get(at index: Int) -> Item
}

struct IntContainer: Container {
    typealias Item = Int
    
    private var items: [Int] = []
    
    mutating func add(_ item: Int) {
        items.append(item)
    }
    
    func get(at index: Int) -> Int {
        items[index]
    }
}

var intContainer = IntContainer()
intContainer.add(1)
intContainer.add(2)
intContainer.add(3)

print(intContainer.get(at: 1))
// 2
