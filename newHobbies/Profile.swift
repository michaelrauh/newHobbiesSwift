import Foundation

struct Profile: Decodable {
    let GUID: String
    
    private enum CodingKeys: String, CodingKey {
        case GUID
    }
}

class Session {
    static let shared = Session()
    var GUID: String?
}
