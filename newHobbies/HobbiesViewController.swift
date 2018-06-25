import UIKit

class HobbiesViewController: UIViewController, ViewDelegate {
    @IBOutlet var label: UILabel!
    
    var navigator = Navigator()
    var viewModel = HobbiesViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getAllHobbies()
    }
    
    @IBAction func labelSwipedLeft(_ sender: UISwipeGestureRecognizer) {
//        let current = hobbies.popLast() ?? "all out"
//        label.text = current
//        disliked.append(current)
    }
    
    @IBAction func labelSwipedRight(_ sender: UISwipeGestureRecognizer) {
//        let current = hobbies.popLast() ?? "all out"
//        label.text = current
//        liked.append(current)
    }
    
    func onSuccess() {
        
    }
    
    func onFailure() {
        print("failure in HobbiesViewController!")
    }
}
