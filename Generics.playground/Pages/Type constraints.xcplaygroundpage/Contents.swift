import Foundation

// Here we are making this func as Generic to findIndex of a particular element from an array
// We have to make sure that T conforms to Equatable or else this function wont compile, because of the equality operator == used
// So this function ensures that the element which will be passed should be Equatable, for the == operator to work

func findIndex<T: Equatable>(of element: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == element {
            return index
        }
    }
    return nil
}

class SomeClass { }
// Sample func
func SomeTypeConstrainedFunc<T: SomeClass, U: Equatable>(someClass: T, someEquatable: U) { }
