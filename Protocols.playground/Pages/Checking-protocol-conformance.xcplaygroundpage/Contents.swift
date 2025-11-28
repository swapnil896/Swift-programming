import Foundation

protocol SecurityEnabled {
    var encryptionKey: String { get }
    var title: String { get }
}

class LoginViewModel: SecurityEnabled {
    var userName: String
    var password: String
    var encryptionKey: String = "1234567788"
    var title: String = "LoginViewModel"
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
}

class RegisterViewModel: SecurityEnabled {
    var email: String
    var userName: String
    var password: String
    var encryptionKey: String = "33221"
    var title: String = "RegisterViewModel"
    
    init(email: String, userName: String, password: String) {
        self.email = email
        self.userName = userName
        self.password = password
    }
}

class DashboardViewModel {
    var userList: [String] = ["John", "Jane", "Doe"]
    var title: String = "DashboardViewModel"
}

// Now if I want to check and filter out which ViewModels are SecurityEnabled
let viewModels: [AnyObject] = [
    LoginViewModel(userName: "john", password: "testpass"),
    RegisterViewModel(email: "john@gmail.com", userName: "john", password: "testpass"),
    DashboardViewModel()
]

var unsecuredVMCount = 0
for viewModel in viewModels {
    if let viewModel = viewModel as? SecurityEnabled {
        print("\(viewModel.title) is Secured with key = \(viewModel.encryptionKey)")
    } else {
        unsecuredVMCount += 1
        print("\(unsecuredVMCount) View Models are not Secured")
    }
}
