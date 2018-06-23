import Quick
import Nimble
import Moxie
@testable import newHobbies

class SignUpViewControllerTests: QuickSpec {
    override func spec() {
        describe("SignUpViewController") {
            var subject: SignUpViewController!
            var navigator: MockNavigator!
            var viewModel: MockViewModel!
            
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpViewController") as! SignUpViewController
                
                navigator = MockNavigator()
                viewModel = MockViewModel()
                
                subject.navigator = navigator
                subject.viewModel = viewModel
                _ = subject.view
            }
            describe("viewDidAppear") {
                describe("when the view model has a user ID") {
                    
                    beforeEach {
                        viewModel.stub(function: "userHasID", return: true)
                        subject.viewDidAppear(false)
                    }
                    
                    it("navigates to the selector view") {
                        expect(navigator.invoked(function: "show")).to(beTrue())
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
                
                it("saves the ID") {
                    expect(viewModel.invoked(function: "saveID")).to(beTrue())
                }
                
                it("navigates to the selector view") {
                    expect(navigator.invoked(function: "show")).to(beTrue())
                }
            }
        }
    }
}

class MockNavigator: Navigator, Mock {
    
    var moxie = Moxie()
    
    override func show(caller: UIViewController, destination: String) {
        record(function: "show", wasCalledWith: [caller, destination])
    }
}

class MockViewModel: SignUpViewModel, Mock {
    
    var moxie = Moxie()
    
    override func saveID() {
        record(function: "saveID")
    }
    
    override func userHasID() -> Bool {
        return value(forFunction: "userHasID") ?? false
    }
}
