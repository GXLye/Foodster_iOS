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
    
    var foodName = "Food Info"
    
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

extension FoodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 { // Food Name & Tags
            let item = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
            item.textLabel?.text = "Veggie Pizza"
            item.detailTextLabel?.text = "RM12.99"
            item.accessoryType = .none
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 1 { // Food Details
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "\nMushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious mushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious… \n"
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 2 { // Food Tags
            let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
            item.textLabel?.text = "Vegetarian, Italian, Pizza"
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 3 { // Restaurant
            let item = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
            item.textLabel?.text = "Restaurant"
            item.detailTextLabel?.text = "Salam Noodles"
            item.accessoryType = .disclosureIndicator
            item.selectionStyle = .none
            return item
        }
        
        if indexPath.row == 4 { // Other restaurants
            let item = tableView.dequeueReusableCell(withIdentifier: "Restaurant", for: indexPath)
            item.textLabel?.text = "Other Restaurants"
            item.detailTextLabel?.text = "3"
            item.accessoryType = .disclosureIndicator
            item.selectionStyle = .none
            return item
        }
        
        // Comments
        let item = tableView.dequeueReusableCell(withIdentifier: "Info", for: indexPath)
        item.textLabel?.text = "Clavier ★★★★☆\nMushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious mushrooms, onions, black olives, red bells, garlic, roasted zucchini. The most delicious… \n"
        return item
        
    }
}
