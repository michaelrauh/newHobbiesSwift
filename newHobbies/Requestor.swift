import CodableAlamofire
import Alamofire

protocol RequestorProtocol {
    func request<T: ResponseDelegate>(withDelegate delegate: T, withPath path: String, withMethod method: HTTPMethod)
}

class Requestor: RequestorProtocol {
    static let shared = Requestor()
    
    private init(){}
    
    func request<T: ResponseDelegate>(withDelegate delegate: T, withPath path: String, withMethod method: HTTPMethod = .get) {
        
        let url = URL(string:"http://localhost:8080/\(path)")!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        Alamofire.request(url, method: method)
            .validate(statusCode: 200...299)
            .responseDecodableObject(decoder: decoder) { (response: DataResponse<T.T>) in
                
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
