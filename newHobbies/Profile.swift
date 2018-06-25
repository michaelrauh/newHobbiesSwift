import Foundation

class Profile: Codable {
    var GUID: String?
    
    private enum CodingKeys: String, CodingKey {
        case GUID
    }
}

