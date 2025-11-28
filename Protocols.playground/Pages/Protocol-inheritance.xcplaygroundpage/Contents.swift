import Foundation

// =================== PROTOCOL INHERITANCE ===================
protocol GrandParent {
    var grandParentName: String { get }
}

protocol Parent: GrandParent {
    var parentName: String { get }
}

protocol Child: Parent {
    var name: String { get }
}

struct Ancestory: Child {
    var parentName: String
    
    var grandParentName: String
    
    var name: String {
        "Child"
    }
}
