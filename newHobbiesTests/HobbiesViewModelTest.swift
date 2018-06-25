import Quick
import Nimble
import Moxie
@testable import newHobbies

class HobbiesViewModelTest: QuickSpec {
    override func spec() {
        describe("HobbiesViewModel") {
            var subject: HobbiesViewModel!
            var view: MockViewDelegate!
            
            beforeEach {
                view = MockViewDelegate()
                subject = HobbiesViewModel()
                
                subject.view = view
            }
            
            describe("getAllHobbies") {
                it("requests the hobbies from the service") {
                }
            }
            
            describe("getNextHobbieText") {
            }
            
            describe("dislikedHobbie") {}
            
            describe("likedHobbie") {}
                
            describe("onSuccess") {}
            
            describe("onFailure") {

            }
        }
    }
}
