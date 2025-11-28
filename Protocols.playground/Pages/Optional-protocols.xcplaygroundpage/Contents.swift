import Foundation

@objc protocol OptionalProtocol {
    @objc optional func optionalMethod()
    @objc optional var optionalProperty: String { get }
}

// @objc protocols can be adopted by only classes, not structs & enums

class LoginViewModel: OptionalProtocol {
    var userName: String
    
    init(userName: String) {
        self.userName = userName
    }
}
