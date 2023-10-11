//
//  FoodsTableViewController.swift
//  FavoriteFoods
//
//  Created by Ryan Plitt on 10/11/23.
//

import UIKit

class FoodsTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let foodCell = "FoodCell"
    }

    var favoriteFoods: [FavoriteFood] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    @IBSegueAction func addFood(_ coder: NSCoder, sender: Any?) -> FoodFormViewController? {
        return FoodFormViewController(coder: coder, favoriteFood: nil)
    }
    
    @IBSegueAction func editFood(_ coder: NSCoder, sender: Any?) -> FoodFormViewController? {
        let foodToEdit: FavoriteFood?
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            foodToEdit = favoriteFoods[indexPath.row]
        } else {
            foodToEdit = nil
        }
        
        return FoodFormViewController(coder: coder, favoriteFood: foodToEdit)
    }
    
    @IBAction func unwindToFoodsTableViewController(_ segue: UIStoryboardSegue) {
        guard
            let foodFormViewController = segue.source as? FoodFormViewController,
            let favFood = foodFormViewController.favoriteFood
        else {
             return
        }

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            favoriteFoods[selectedIndexPath.row] = favFood
        } else {
            favoriteFoods.append(favFood)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteFoods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.foodCell, for: indexPath)
        
        let favoriteFood = favoriteFoods[indexPath.row]
        cell.textLabel?.text = favoriteFood.name
        cell.detailTextLabel?.text = favoriteFood.food
        
        return cell
    }
}
