import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameText: UITextField!

    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mealNameText.delegate = self
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
}

