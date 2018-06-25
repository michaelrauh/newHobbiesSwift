import Moxie
@testable import newHobbies

class MockNavigator: Navigator, Mock {
    
    var moxie = Moxie()
    
    override func show(caller: UIViewController, destination: String) {
        record(function: "show", wasCalledWith: [caller, destination])
    }
}
