import Moxie
@testable import newHobbies

class MockHobbiesViewModel: HobbiesViewModel, Mock {
    var moxie = Moxie()
    
    override func getAllHobbies() {
        record(function: "getAllHobbies")
    }
    
    override func getNextHobbieText() -> String {
        return value(forFunction: "getNextHobbieText") ?? "stub me"
    }
    
    override func dislikedHobbie(_ hobbieText: String) {
        record(function: "dislikedHobbie")
    }
    
    override func likedHobbie(_ hobbieText: String) {
        record(function: "likedHobbie")
    }
}
