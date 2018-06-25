import Moxie
@testable import newHobbies

class MockRequestor: RequestorProtocol, Mock {
    var moxie = Moxie()
    
    func request<T: ResponseDelegate>(withDelegate delegate: T, withPath path: String) {
        record(function: "request", wasCalledWith: [delegate, path])
    }
}
