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
