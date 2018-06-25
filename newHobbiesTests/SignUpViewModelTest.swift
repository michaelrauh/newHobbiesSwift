import Quick
import Nimble
import Moxie
@testable import newHobbies

class SignUpViewModelTests: QuickSpec {
    override func spec() {
        describe("SignUpViewModel") {
            var subject: SignUpViewModel!
            var defaults: MockUserDefaults!
            var view: MockViewDelegate!
            
            beforeEach {
                view = MockViewDelegate()
                subject = SignUpViewModel()
                
                defaults = MockUserDefaults()
                
                subject.defaults = defaults
                subject.view = view
            }
            
            describe("getID") {
                it("returns the ID") {
                    defaults.stub(function: "string", return: "ID")
                    
                    expect(subject.getID()).to(equal("ID"))
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
            
            describe("request ID") {
                let mockRequestor = MockRequestor()
                
                beforeEach {
                    subject.requestor = mockRequestor
                    subject.requestID()
                }
                
                it("requests a user ID") {
                    expect(mockRequestor.invoked(function: "request")).to(beTrue())
                    let params = mockRequestor.parameters(forFunction: "request")
                    let delegate = params[0] as! SignUpViewModel
                    let path = params[1] as! String
                    expect(delegate).to(be(subject))
                    expect(path).to(equal("profile"))
                }
            }
            describe("onSuccess") {
                var profile: Profile?
                beforeEach {
                    profile = Profile()
                    profile?.GUID = "GUID01"
                    
                    subject.onSuccess(result: profile)
                }
                
                it("saves the profile in the session") {
                    expect(Session.shared.profile).to(be(profile))
                }
                
                it("notifies the view") {
                    expect(view.invoked(function: "onSuccess")).to(beTrue())
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
            
            describe("onFailure") {
                
                beforeEach {
                    subject.onFailure(error: MockError())
                }
                
                it("notifies the view") {
                    expect(view.invoked(function: "onFailure")).to(beTrue())
                }
            }
        }
    }
}
