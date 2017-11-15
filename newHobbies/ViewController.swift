import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var hobbies = ["climbing", "bouldering", "guitar", "listening to guitar", "playing guitar"]
    var liked: [String] = []
    var disliked: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func labelSwipedLeft(_ sender: UISwipeGestureRecognizer) {
        let current = hobbies.popLast() ?? "all out"
        label.text = current
        disliked.append(current)
    }
    
    @IBAction func labelSwiped(_ sender: UISwipeGestureRecognizer) {
        let current = hobbies.popLast() ?? "all out"
        label.text = current
        liked.append(current)
    }
}
