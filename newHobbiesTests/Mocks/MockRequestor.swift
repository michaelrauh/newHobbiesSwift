import Moxie
import Alamofire
@testable import newHobbies

class MockRequestor: RequestorProtocol, Mock {
    var moxie = Moxie()
    
    func request<T: ResponseDelegate>(withDelegate delegate: T, withPath path: String, withMethod method: HTTPMethod) {
        record(function: "request", wasCalledWith: [delegate, path, method])
    }
}
