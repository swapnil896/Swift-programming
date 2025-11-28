import Foundation

// Question :-
// 1. Does Equatable protocol when conformed, need to implement its == method requirement
// 2. Why protocols like Equatable when conformed by structs or enums don't require to implement    its == method requirement
/*
 - Equatable requires you to implement ==

 - But Swift auto-generates it for structs & enums when all stored properties are also Equatable

 - Classes never get auto-synthesis, because -> Classes are reference types -> Classes support inheritance

 - That’s why you “don’t need” to write == in many cases
 
 */

// Q :- Can you create such protocols
// A :- Yes, you can create protocol like Equatable, but Swift will not do auto-synthesis for you

// =========== Equatable Synthesized implementation =============================================
// With Struct
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2, y: 3, z: 4)
let otherTwoThreeFour = Vector3D(x: 2, y: 3, z: 4)
if twoThreeFour == otherTwoThreeFour {
    print("Both vectors are equal.")
}

// With Enum
enum ResultStatus: Equatable {
    case success
    case failure(code: Int)
}

// With Class
class Person: Equatable {
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
}

let person1 = Person(id: 1)
let person2 = Person(id: 1)
if person1 == person2 {
    print("Both persons are equal.")
}
//Both persons are equal.


// =========== Comparable Synthesized implementation =============================================
/*
 Swift provides a synthesized implementation of Comparable for enumerations that don’t have a raw value.
 If the enumeration has associated types, they must all conform to the Comparable protocol.
 */
enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(level: Int)
}

let levels: [SkillLevel] = [.intermediate, .beginner, .expert(level: 5), .expert(level: 3)]
for level in levels.sorted() {
    print(level)
}

/*
 OUTPUT :=
 beginner
 intermediate
 expert(level: 3)
 expert(level: 5)
 */

// =========== Use of Hashable protocol =============================================

// Hashable is a protocol that lets a type be hashed — meaning it can produce a unique-ish integer hash value.

// Any type conforming to Hashable can be used like this:
// var set: Set<User>
// var dict: [User: String]

struct User: Hashable, Codable {
    let id: Int
    let name: String
}

var users: Set<User> = []
let user1 = User(id: 1, name: "John")
let user2 = User(id: 1, name: "John")
users.insert(user1)
users.insert(user2)
print(users)
print(users.count)

// Above code will ignore the duplicate values as its a Set
// OUTPUT :-
// [__lldb_expr_4534.User(id: 1, name: "John")]
// 1

// Question :- I have an API which gives list of Users, but there can be duplicate entries of Users, how will you decode unique Users from that API
// Ans :- Use above code by conforming User to Codable also

struct ResponseData: Codable {
    let data: Set<User>
}

let jsonData: Data = Data()
do {
    let decoder = JSONDecoder()
    let decodedSet = try decoder.decode(ResponseData.self, from: jsonData)
} catch {
    print("Decoding error")
}
