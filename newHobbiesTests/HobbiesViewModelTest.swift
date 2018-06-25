import Quick
import Nimble
import Moxie
import Alamofire
@testable import newHobbies

class HobbiesViewModelTest: QuickSpec {
    override func spec() {
        describe("HobbiesViewModel") {
            var subject: HobbiesViewModel!
            var view: MockViewDelegate!
            var requestor: MockRequestor!
            
            beforeEach {
                view = MockViewDelegate()
                subject = HobbiesViewModel()
                requestor = MockRequestor()
                
                subject.view = view
                subject.requestor = requestor
            }
            
            describe("getAllHobbies") {
                
                beforeEach {
                    subject.getAllHobbies()
                }
                
                it("requests the hobbies from the service") {
                    expect(requestor.invoked(function: "request")).to(beTrue())
                    let params = requestor.parameters(forFunction: "request")
                    
                    expect(requestor.invoked(function: "request")).to(beTrue())
                    let delegate = params[0] as! HobbiesViewModel
                    let path = params[1] as! String
                    let method = params[2] as! HTTPMethod
                    
                    expect(delegate).to(be(subject))
                    expect(path).to(equal("hobbies"))
                    expect(method).to(equal(.get))
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
