import Quick
import Nimble
import Moxie
@testable import newHobbies

class HobbiesViewControllerTest: QuickSpec {
    override func spec() {
        describe("HobbiesViewController") {
            var subject: HobbiesViewController!
            var navigator: MockNavigator!
            var viewModel: MockHobbiesViewModel!
            
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "hobbiesViewController") as! HobbiesViewController
                
                navigator = MockNavigator()
                viewModel = MockHobbiesViewModel()
                
                subject.navigator = navigator
                subject.viewModel = viewModel
                _ = subject.view
            }
            
            describe("viewDidAppear") {
                it("asks the view model for the list of all hobbies") {
                    subject.viewDidAppear(false)
                    expect(viewModel.invoked(function: "getAllHobbies")).to(beTrue())
                }
                
                it("sets itself as the viewdelegate for the viewModel") {
                    subject.viewDidAppear(false)
                    
                    expect(viewModel.view).to(be(subject))
                }
            }
            
            describe("onSuccess"){
                beforeEach {
                    viewModel.stub(function: "getNextHobbieText", return: "this is a label")
                    subject.onSuccess()
                }
                
                it("loads the first hobbie into the label") {
                    expect(subject.label.text).to(equal("this is a label"))
                }
            }
            
            describe("swipe left") {
                
                beforeEach {
                    viewModel.stub(function: "getNextHobbieText", return: "this is a different label")
                        subject.labelSwipedLeft(MockGestureRecognizer())
                }
                
                it("notifies the view model that a hobbie has been disliked") {
                    expect(viewModel.invoked(function: "dislikedHobbie")).to(beTrue())
                }
                
                it("sets the label text to the next hobbie") {
                    expect(subject.label.text).to(equal("this is a different label"))
                }
            }
            
            describe("swipe right") {
                
                beforeEach {
                    viewModel.stub(function: "getNextHobbieText", return: "this is yet another label")
                    subject.labelSwipedRight(MockGestureRecognizer())
                }
                
                it("notifies the view model that a hobbie has been liked") {
                    expect(viewModel.invoked(function: "likedHobbie")).to(beTrue())
                }
                
                it("sets the label text to the next hobbie") {
                    expect(subject.label.text).to(equal("this is yet another label"))
                }
            }
        }
    }
}
