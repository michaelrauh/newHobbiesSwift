import Foundation

class SignUpViewModel: ResponseDelegate {
    typealias T = Profile
    
    var defaults: UserDefaults = UserDefaults.standard
    var requestor: RequestorProtocol = Requestor.shared
    var view: ViewDelegate?
    
    func saveID(_ guid: String) {
        defaults.set(guid, forKey: "userID")
    }
    
    func userHasID() -> Bool {
        return (defaults.string(forKey: "userID")) != nil
    }
    
    func getID() -> String {
        return defaults.string(forKey: "userID") ?? ""
    }
    
    func requestID() {
        requestor.request(withDelegate: self, withPath: "profile")
    }
    
    func onSuccess(result: Profile?) {
        print("Got new profile from service: \(String(describing: result))")
        
        Session.shared.profile = result
        saveID(result?.GUID ?? "")
        view?.onSuccess()
    }
    
    func onFailure(error: Error) {
        print("signUpResponseDelegate failure: " + error.localizedDescription)
        view?.onFailure()
    }
}
