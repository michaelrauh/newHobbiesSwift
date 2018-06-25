import Moxie
@testable import newHobbies

class MockUserDefaults: UserDefaults, Mock {
    
    var moxie = Moxie()
    
    override func set(_ value: Any?, forKey defaultName: String) {
        record(function: "set", wasCalledWith: [value, defaultName])
    }
    
    override func string(forKey defaultName: String) -> String? {
        return value(forFunction: "string")
    }
}
