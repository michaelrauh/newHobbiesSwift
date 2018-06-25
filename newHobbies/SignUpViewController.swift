import Foundation
import UIKit

class SignUpViewController: UIViewController, ViewDelegate {
    @IBOutlet var genIDButton: UIButton!
    
    var viewModel: SignUpViewModel = SignUpViewModel()
    var navigator: Navigator = Navigator()
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.view = self as ViewDelegate
        
        if (viewModel.userHasID()) {
            Session.shared.profile = Profile()
            Session.shared.profile?.GUID = viewModel.getID()
            navigator.show(caller: self, destination: "hobbiesViewController")
        }
    }
    
    @IBAction func genIDWasTapped() {
        viewModel.requestID()
    }
    
    func onSuccess() {
        navigator.show(caller: self, destination: "hobbiesViewController")
    }
    
    func onFailure() {
        print("failed to retreive GUID")
    }
}
