class Session {
    static let shared = Session()
    var profile: Profile?
    
    private init(){}
}
