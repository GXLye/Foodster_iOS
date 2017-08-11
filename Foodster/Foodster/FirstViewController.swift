//
//  FirstViewController.swift
//  Foodster
//
//  Created by Lye Guang Xing on 11/08/2017.
//  Copyright © 2017 Stencil Code. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, UITableViewDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        
        if let diets = UserDefaults.init(suiteName: Constants.groupKey)?.value(forKey: Constants.dietsKey) as? [String] {
            print(diets)
        }
        
        if let cuisines = UserDefaults.init(suiteName: Constants.groupKey)?.value(forKey: Constants.cuisinesKey) as? [String] {
            print(cuisines)
        }
        
        let annotationView = MKPinAnnotationView()
        annotationView.animatesDrop = true
        var annotations: [MKPointAnnotation] = []
        
        for restaurant in Constants.sampleRest {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(restaurant.latitude)!, longitude: CLLocationDegrees(restaurant.longitude)!)
            annotation.title = restaurant.name
//            mapView.addAnnotation(annotation)
            annotations.append(annotation)
        }
        mapView.showAnnotations(annotations, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension FirstViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.sampleRest[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        item.textLabel?.text = "Roti Canai"
        item.detailTextLabel?.text = "Mamak, Vegetarian"
        item.imageView?.downloadedFrom(link: "http://media.themalaymailonline.com/uploads/articles/Crave/2017/2017-01/LanRoti01.jpg")
        
        return item
    }
}

