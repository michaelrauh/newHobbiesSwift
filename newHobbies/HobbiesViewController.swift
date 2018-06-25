import UIKit

class HobbiesViewController: UIViewController, ViewDelegate {
    @IBOutlet var label: UILabel!
    
    var navigator = Navigator()
    var viewModel = HobbiesViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.view = self
        viewModel.getAllHobbies()
    }
    
    @IBAction func labelSwipedLeft(_ sender: UISwipeGestureRecognizer) {
        viewModel.dislikedHobbie(label.text ?? "")
        label.text = viewModel.getNextHobbieText()
    }
    
    @IBAction func labelSwipedRight(_ sender: UISwipeGestureRecognizer) {
        viewModel.likedHobbie(label.text ?? "")
        label.text = viewModel.getNextHobbieText()
    }
    
    func onSuccess() {
        label.text = viewModel.getNextHobbieText()
    }
    
    func onFailure() {
        print("failure in HobbiesViewController!")
    }
}
