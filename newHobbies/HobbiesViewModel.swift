class HobbiesViewModel: ResponseDelegate {
    typealias T = Hobbie
    
    var view: ViewDelegate?
    var requestor: RequestorProtocol = Requestor.shared
    
    func getAllHobbies() {
        requestor.request(withDelegate: self, withPath: "hobbies", withMethod: .get)
    }
    
    func getNextHobbieText() -> String {
        return "STUB!"
    }
    
    func dislikedHobbie(_ hobbieText: String) {
        
    }
    
    func likedHobbie(_ hobbieText: String) {
        
    }
    
    func onSuccess(result: Hobbie?) {
        
    }
    
    func onFailure(error: Error) {
        
    }
}
