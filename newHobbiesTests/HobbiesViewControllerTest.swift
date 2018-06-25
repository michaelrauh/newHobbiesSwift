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
            }
        }
    }
}
