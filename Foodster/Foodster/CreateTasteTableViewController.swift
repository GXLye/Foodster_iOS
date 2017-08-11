//
//  CreateTasteTableViewController.swift
//  Foodster
//
//  Created by Lye Guang Xing on 11/08/2017.
//  Copyright © 2017 Stencil Code. All rights reserved.
//

import UIKit

class CreateTasteTableViewController: UITableViewController {

    var diets = Set<String>()
    var cuisines = Set<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableView.cellForRow(at: indexPath)!
        
        if item.accessoryType == .none {
            item.accessoryType = .checkmark
            if indexPath.section == 0 {
                let selected = (item.textLabel?.text!)!
                
                if !diets.contains(selected) {
                    diets.insert(selected)
                }
            } else {
                let selected = (item.textLabel?.text!)!
                
                if !cuisines.contains(selected) {
                    cuisines.insert(selected)
                }
            }
        } else {
            item.accessoryType = .none
            if indexPath.section == 0 {
                let selected = (item.textLabel?.text!)!
                
                if diets.contains(selected) {
                    diets.remove(selected)
                }
            } else {
                let selected = (item.textLabel?.text!)!
                
                if cuisines.contains(selected) {
                    cuisines.remove(selected)
                }
            }
        }
        
        item.setSelected(false, animated: false)
    }

    @IBAction func createProfile(_ sender: Any) {
        print(diets)
        print(cuisines)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
