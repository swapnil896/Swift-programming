import Foundation
import UIKit

// =========== INITIALIZER REQUIREMENTS ===============================

protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    // Here required init is usually required, if the class is not marked as final
    // The use of the required modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.
    required init(someParameter: Int) {
        
    }
}

final class someFinalClass: SomeProtocol {
    // As final classes cannot be subclassed further, required init is not required here
    var someParameter: Int
    init(someParameter: Int) {
        self.someParameter = someParameter
    }
}


// === Sample Use Case =========
@MainActor
protocol Screen {
    init(title: String)
}

class HomeScreen: UIViewController, Screen {
    required init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//

protocol SomeProtocolNew {
    init()
}

class SomeSuperClass: SomeProtocolNew {
    required init() {
        print("Inside Superclass")
    }
}

class SomeSubClass: SomeSuperClass {
    required init() {
        print("Inside Subclass")
    }
}

let subClass = SomeSubClass()
/*
 OUTPUT :-
 Inside Subclass
 Inside Superclass
*/
