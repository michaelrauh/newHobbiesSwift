import Moxie
@testable import newHobbies

class MockHobbiesViewModel: HobbiesViewModel, Mock {
    var moxie = Moxie()
    
    override func getAllHobbies() {
        record(function: "getAllHobbies")
    }
}
