import Foundation

class SignUpViewModel {
    var defaults: UserDefaults = UserDefaults.standard
    
    func saveID() {
        defaults.set("GUID01", forKey: "userID")
    }
    
    func userHasID() -> Bool {
        return (defaults.string(forKey: "userID")) != nil
    }
    
    func requestID() {
        
    }
}
