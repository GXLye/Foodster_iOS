//
//  RestaurantViewController.swift
//  Foodster
//
//  Created by Lye Guang Xing on 12/08/2017.
//  Copyright © 2017 Stencil Code. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var foodName = "Restaurant Info"
    var selectedFood = Food(name: "", rating: 0.0, image: "", price: 0.0, restaurant: "")
    var selectedRestaurant = Restaurant(name: "", latitude: "", longitude: "", image: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodImage.downloadedFrom(link: "http://www.salamnoodles.com/assets/images/shop1.jpg", contentMode: .scaleAspectFill)
        self.navigationItem.title = foodName
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension RestaurantViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 { // Restaurant Name & Ratings
            let item = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
            item.textLabel?.text = "Salam Noodles"
            item.detailTextLabel?.text = "★★★☆☆ (3 reviews)"
            item.accessoryType = .none
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 1 { // Restaurant Details
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "\nMushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious mushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious meal. \n"
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 2 { // Restaurant Tags
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "Vegetarian, Italian, Pizza\n"
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 3 { // Reviews
            let item = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
            item.textLabel?.text = "Reviews"
            item.detailTextLabel?.text = "★★★☆☆ (3)"
            item.accessoryType = .disclosureIndicator
            return item
        }
        
        if indexPath.row == 4 { // Signature Dishes Title
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "\n\nSignature Dishes"
            item.selectionStyle = .none
            return item
        }
        
        // Food Menu
        let item = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        item.textLabel?.text = "Roti Canai"
        item.detailTextLabel?.text = "Mamak, Vegetarian"
        item.imageView?.image = UIImage(named: "Blank")
        item.imageView?.downloadedFrom(link: "http://www.salamnoodles.com/assets/images/shop1.jpg", contentMode: .scaleAspectFill)
        item.accessoryType = .disclosureIndicator
        return item
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row > 4 {
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FoodViewController") as? FoodViewController {
                viewController.selectedFood = selectedFood
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
    }
}
