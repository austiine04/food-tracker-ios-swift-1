import UIKit

class MealTableViewController: UITableViewController {
    var meals = [Meal]()

    func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")!
        meals.append(Meal(name: "Caprese Salad", photo: photo1, rating: 4)!)
        
        let photo2 = UIImage(named: "meal2")!
        meals.append(Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!)
        
        let photo3 = UIImage(named: "meal3")!
        meals.append(Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMeals()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    //MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.meal {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                meals[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let mealDetailViewController = segue.destinationViewController as! MealViewController
            if let selectedMealCell = sender as? MealTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedMeal = meals[indexPath.row]
                mealDetailViewController.meal = selectedMeal
            }
        } else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
}
