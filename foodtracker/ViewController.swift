import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameText: UITextField!

    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

