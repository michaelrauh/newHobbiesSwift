import CodableAlamofire
import Alamofire

protocol RequestorProtocol {
    func request<T: ResponseDelegate>(withDelegate delegate: T, withPath path: String)
}

class Requestor: RequestorProtocol {
    static let shared = Requestor()
    
    private init(){}
    
    func request<T: ResponseDelegate>(withDelegate delegate: T, withPath path: String) {
        
        let url = URL(string:"https://fakebasepath/\(path)/")!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        Alamofire.request(url)
            .validate(statusCode: 200...299)
            .responseDecodableObject(keyPath: "result.libraries", decoder: decoder) { (response: DataResponse<T.T>) in
                
                switch response.result {
                case .success:
                    let object = response.result.value
                    delegate.onSuccess(result: object as T.T?)
                case .failure(let error):
                    delegate.onFailure(error: error)
                }
        }
    }
}
