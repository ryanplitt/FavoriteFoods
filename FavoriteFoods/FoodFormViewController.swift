import UIKit

class FoodFormViewController: UIViewController {
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    struct PropertyKeys {
        static let unwindToListSegue = "unwindToFoodsTableViewController"
    }
    
    var favoriteFood: FavoriteFood?
    
    init?(coder: NSCoder, favoriteFood: FavoriteFood?) {
        self.favoriteFood = favoriteFood
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let favoriteFood else {
            return
        }
        
        nameTextField.text = favoriteFood.name
        foodTextField.text = favoriteFood.food
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text,
            let food = foodTextField.text else { return }
                
        favoriteFood = FavoriteFood(name: name, food: food)
        
        performSegue(withIdentifier: PropertyKeys.unwindToListSegue, sender: self)
    }
    
}
