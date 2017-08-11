//
//  FirstViewController.swift
//  Foodster
//
//  Created by Lye Guang Xing on 11/08/2017.
//  Copyright © 2017 Stencil Code. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let diets = UserDefaults.init(suiteName: Constants.groupKey)?.value(forKey: Constants.dietsKey) as? [String] {
            print(diets)
        }
        
        if let cuisines = UserDefaults.init(suiteName: Constants.groupKey)?.value(forKey: Constants.cuisinesKey) as? [String] {
            print(cuisines)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

