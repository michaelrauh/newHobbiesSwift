protocol ResponseDelegate {
    associatedtype T: Codable
    func onSuccess (result: T?) -> Void
    func onFailure(error: Error) -> Void
}
