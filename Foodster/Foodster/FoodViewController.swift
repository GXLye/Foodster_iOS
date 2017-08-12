//
//  FoodViewController.swift
//  Foodster
//
//  Created by Lye Guang Xing on 12/08/2017.
//  Copyright © 2017 Stencil Code. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedFood = Food(name: "", rating: 0.0, image: "", price: 0.0, restaurant: "", tags: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodImage.downloadedFrom(link: selectedFood.image, contentMode: .scaleAspectFill)
        self.navigationItem.title = "Food Info"
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoodRestaurant" {
            let foodView = segue.destination as! RestaurantViewController
            
            foodView.restaurantName = selectedFood.restaurant
            
            //navigationController?.transitioningDelegate = self.transitionManager
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 { // Food Name & Tags
            let item = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
            
            item.textLabel?.text = selectedFood.name
            item.detailTextLabel?.text = "RM\(selectedFood.price.toPrice)"
            item.accessoryType = .none
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 1 { // Food Details
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "Average Ratings: \(selectedFood.rating.toRatings) (2 reviews)\n\nMushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious mushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious meal. \n"
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 2 { // Food Tags
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "\(selectedFood.tags)\n"
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 3 { // Restaurant
            let item = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
            item.textLabel?.text = "Restaurant"
            item.detailTextLabel?.text = selectedFood.restaurant
            item.accessoryType = .disclosureIndicator
            return item
        }
        
        if indexPath.row == 4 { // Other restaurants
            let item = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
            item.textLabel?.text = "Other Restaurants"
            item.detailTextLabel?.text = "3"
            item.accessoryType = .disclosureIndicator
            return item
        }
        
        if indexPath.row == 5 { // Reviews Title
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "\n\nReviews"
            item.selectionStyle = .none
            return item
        }
        
        // Comments
        let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
        item.textLabel?.text = "Clavier \(selectedFood.rating.toRatings)\nMushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious mushrooms, onions, black olives, red bells, garlic, roasted zucchini.\n"
        item.selectionStyle = .none
        return item
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 3 {
            performSegue(withIdentifier: "showFoodRestaurant", sender: nil)
        }
    }
}
