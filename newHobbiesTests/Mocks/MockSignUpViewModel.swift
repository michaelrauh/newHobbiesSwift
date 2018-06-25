import Moxie
@testable import newHobbies

class MockSignUpViewModel: SignUpViewModel, Mock {
    
    var moxie = Moxie()
    
    override func saveID(_ guid: String) {
        record(function: "saveID")
    }
    
    override func userHasID() -> Bool {
        return value(forFunction: "userHasID") ?? false
    }
    
    override func requestID() {
        record(function: "requestID")
    }
    
    override func getID() -> String {
        return value(forFunction: "getID") ?? ""
    }
}
