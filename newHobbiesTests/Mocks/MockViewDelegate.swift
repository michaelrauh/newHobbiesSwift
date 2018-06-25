import Moxie
@testable import newHobbies

class MockViewDelegate: ViewDelegate, Mock {
    var moxie = Moxie()
    
    func onSuccess() {
        record(function: "onSuccess")
    }
    
    func onFailure() {
        record(function: "onFailure")
    }
}
