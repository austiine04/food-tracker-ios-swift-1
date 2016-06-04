import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var mealNameText: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal = Meal?()
    
    //MARK: navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = mealNameText.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }

    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        mealNameText.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mealNameText.delegate = self
        checkValidMealName()

        if let meal = meal {
            navigationItem.title = meal.name
            mealNameText.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }

    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }

    func checkValidMealName() {
        let text = mealNameText.text ?? ""
        saveButton.enabled = !text.isEmpty
    }

    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
}

