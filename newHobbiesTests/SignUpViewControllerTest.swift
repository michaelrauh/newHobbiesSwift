import Quick
import Nimble
import Moxie
@testable import newHobbies

class SignUpViewControllerTests: QuickSpec {
    override func spec() {
        describe("SignUpViewController") {
            var subject: SignUpViewController!
            var navigator: MockNavigator!
            var viewModel: MockSignUpViewModel!
            
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpViewController") as! SignUpViewController
                
                navigator = MockNavigator()
                viewModel = MockSignUpViewModel()
                
                subject.navigator = navigator
                subject.viewModel = viewModel
                _ = subject.view
            }
            
            describe("viewDidAppear") {
                describe("when the view model has a user ID") {
                    
                    beforeEach {
                        viewModel.stub(function: "userHasID", return: true)
                        viewModel.stub(function: "getID", return: "Sean")
                        subject.viewDidAppear(false)
                    }
                    
                    it("navigates to the selector view") {
                        expect(navigator.invoked(function: "show")).to(beTrue())
                    }
                    
                    it("makes itself the delegate for the view model") {
                        expect(viewModel.view).to(be(subject))
                    }
                    
                    it("saves the ID to the session") {
                        expect(Session.shared.profile?.GUID).to(equal("Sean"))
                    }
                }
                
                describe("when the view model has no user ID") {
                    beforeEach {
                        viewModel.stub(function: "userHasID", return: false)
                        subject.viewDidAppear(false)
                    }
                    
                    it("navigates to the selector view") {
                        expect(navigator.invoked(function: "show")).to(beFalse())
                    }
                }
            }
            describe("genIDWasTapped") {
                beforeEach {
                    subject.genIDButton.sendActions(for: .touchUpInside)
                }
                
                it("requests an ID from the view model") {
                    expect(viewModel.invoked(function: "requestID")).to(beTrue())
                }
                
                describe("onSuccess") {
                    it("goes to the next screen") {
                        subject.onSuccess()
                        expect(navigator.invoked(function: "show")).to(beTrue())
                    }
                }
            }
        }
    }
}
