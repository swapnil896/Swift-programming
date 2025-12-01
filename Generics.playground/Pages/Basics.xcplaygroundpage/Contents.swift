import UIKit

// Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define.

// much of the Swift standard library is built with generic code.
// For example, Swift’s Array and Dictionary types are both generic collections. You can create an array that holds Int values, or an array that holds String values, or indeed an array for any other type that can be created in Swift. Similarly, you can create a dictionary to store values of any specified type, and there are no limitations on what that type can be.

// Code without Generics
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// Code with Generics
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var first = 3
var second = 5
swapTwoInts(&first, &second)

swapTwoValues(&first, &second)

var firstString = "abc"
var secondString = "xyz"

swapTwoValues(&firstString, &secondString)

// the placeholder type T is an example of a type parameter
