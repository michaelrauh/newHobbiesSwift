import Foundation
import UIKit

class SignUpViewController: UIViewController, ViewDelegate {
    @IBOutlet var genIDButton: UIButton!
    
    var viewModel: SignUpViewModel = SignUpViewModel()
    var navigator: Navigator = Navigator()
    
    override func viewDidAppear(_ animated: Bool) {
        if (viewModel.userHasID()) {
            navigator.show(caller: self, destination: "selector")
        }
    }
    
    @IBAction func genIDWasTapped() {
        viewModel.requestID()
    }
    
    func onSuccess() {
        navigator.show(caller: self, destination: "selector")
    }
    
    func onFailure() {
        print("failed to retreive GUID")
    }
}
