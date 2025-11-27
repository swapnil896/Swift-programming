import UIKit

/*
 Protocols
 Define requirements that conforming types must implement.
 */

protocol SomeProtocol {
    var text: String { get }
    var number: Int { get set }
}

// Above protocol when conformed by any type (Class, Struct, or Enum)
class SomeClass: SomeProtocol {
    // We can declare text property as constant (let) as it is just gettable property
    let text: String = ""
    
    // We cannot declare number property as constant, as it is get-set property
    var number: Int = 0
}


class SuperClass { }

// When a BaseClass which has a SuperClass wants to conform to a protocol, it should be written like this, First -> inherit superclass, second -> conform to protocol
class BaseClass: SuperClass, SomeProtocol {
    var text: String = ""
    var number: Int = 0
}

// Protocol with Type property
protocol AnotherProtocol {
    static var someTypeProperty: String { get }
}

// Using protocol property req as computed property
class Table: SomeProtocol {
    
    var text: String {
        return "Text"
    }
    
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

// ========= METHOD REQUIREMENTS ======================

protocol MethodProtocol {
    func someMethod()
    func someMethodWithParameter(param: String)
    func someMethodWithReturnType() -> String
    
    // Type method
    static func someTypeMethod()
}

// Can only be conformed by classes
protocol classOnlyProtocol: AnyObject {
    func someClassOnlyMethod()
}

// Error :- Non-class type 'Stack' cannot conform to class protocol 'classOnlyProtocol'
//struct Stack: classOnlyProtocol {
//    
//}

// ========= MUTATING METHOD REQUIREMENTS ======================
// mutating indicates that the method is allowed to modify the instance it belongs to and any properties of that instance.
// In context of protocol, if you want any conforming value type to mutate its instances, then mark the protocol function mutating
// Same is not true when classes conform to protocol with mutating func, you don't require mutating keyword for its implementation

// IMP -----
// mutating is needed because structs modify the value itself, not an object.
// Classes mutate an object on the heap, not the variable → no permission needed.

protocol Togglable {
    mutating func toggle()
}

enum Toggle: Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .on
        case .off:
            self = .off
        }
    }
}

class TogglableClass: Togglable {
    
    func toggle() {
        
    }
}

// ===== Another way of conforming to protocols -> If a type already implements the required functions then you can just conform that type as below
struct Switcher {
    
    var switchIsOn = true
    
    mutating func toggle() {
        self.switchIsOn = false
    }
}

extension Switcher: Togglable { }
