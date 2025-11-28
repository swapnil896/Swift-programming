import Foundation

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    let name: String
    let age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday to \(celebrator.name) with age \(celebrator.age)")
}

let person = Person(name: "John", age: 30)
wishHappyBirthday(to: person)

struct Employee: Named, Aged {
    let name: String
    let age: Int
    let position: String
}

let employee = Employee(name: "Jane", age: 25, position: "Engineer")
wishHappyBirthday(to: employee)

/*
 The type of the celebrator parameter is Named & Aged, which means “any type that conforms to both the Named and Aged protocols.” It doesn’t matter which specific type is passed to the function, as long as it conforms to both of the required protocols.
 */


