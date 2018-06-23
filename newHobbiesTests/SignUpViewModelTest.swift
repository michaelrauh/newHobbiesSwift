import Quick
import Nimble
import Moxie
@testable import newHobbies

class SignUpViewModelTests: QuickSpec {
    override func spec() {
        describe("SignUpViewModel") {
            var subject: SignUpViewModel!
            var defaults: MockUserDefaults!
            
            beforeEach {
                subject = SignUpViewModel()
                
                defaults = MockUserDefaults()
                
                subject.defaults = defaults
            }
            describe("saveID") {
                
                beforeEach {
                    subject.saveID()
                }
                
                it("saves The ID to user defaults") {
                    expect(defaults.invoked(function: "set")).to(beTrue())
                    let params = defaults.parameters(forFunction: "set", invocation: 1)
                    let guid = params[0] as! String
                    let key = params[1] as! String
                    
                    expect(guid).to(equal("GUID01"))
                    expect(key).to(equal("userID"))
                }
            }
            describe("userHasID") {
                it("returns true if user defaults has an entry at the key") {
                    defaults.stub(function: "string", return: "GUID01")
                    
                    expect(subject.userHasID()).to(beTrue())
                }
                
                it("returns false if user defaults has no entry at the key") {
                    expect(subject.userHasID()).to(beFalse())
                }
            }
        }
    }
}

class MockUserDefaults: UserDefaults, Mock {
    
    var moxie = Moxie()
    
    override func set(_ value: Any?, forKey defaultName: String) {
        record(function: "set", wasCalledWith: [value, defaultName])
    }
    
    override func string(forKey defaultName: String) -> String? {
        return value(forFunction: "string")
    }
}
