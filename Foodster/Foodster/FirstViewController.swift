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
    
    var annotations: [MKPointAnnotation] = []
    var foodName = ""
    var selectedImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mapView.delegate = self
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
        
        mapView.removeAnnotations(annotations)
        
        
        for restaurant in Constants.sampleRest {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(restaurant.latitude)!, longitude: CLLocationDegrees(restaurant.longitude)!)
            annotation.title = restaurant.name
            if let distance = userDistance(from: annotation) {
                annotation.subtitle = "\(distance.noDecimal)"
            }
//            mapView.addAnnotation(annotation)
            annotations.append(annotation)
        }
        mapView.showAnnotations(annotations, animated: true)
        
    }
    
    /// Returns the distance (in meters) from the
    /// user's location to the specified point.
    private func userDistance(from point: MKPointAnnotation) -> Double? {
        guard let userLocation = mapView.userLocation.location else {
            return nil // User location unknown!
        }
        let pointLocation = CLLocation(
            latitude:  point.coordinate.latitude,
            longitude: point.coordinate.longitude
        )
        return userLocation.distance(from: pointLocation)
    }
    
    /*func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var view: MKPinAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKPinAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.animatesDrop = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
        }
        return view
    }*/
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        for (index, restaurant) in Constants.sampleRest.enumerated() {
            if restaurant.name == (view.annotation?.title)! {
                tableView.scrollToRow(at: IndexPath(row:0, section: index), at: .top, animated: true)
            }
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFood" {
            let foodView = segue.destination as! FoodViewController
            
//            foodView.foodImage.image = selectedImage.image
            foodView.foodName = foodName
            
//            navigationController?.transitioningDelegate = self.transitionManager
        }
    }
}

extension FirstViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.sampleRest[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        item.textLabel?.text = "Roti Canai"
        item.detailTextLabel?.text = "Mamak, Vegetarian"
        item.imageView?.image = UIImage(named: "Blank")
        item.imageView?.downloadedFrom(link: "http://www.salamnoodles.com/assets/images/shop1.jpg", contentMode: .scaleAspectFill)
        
        return item
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        foodName = (item.textLabel?.text)!
//        selectedImage.image = (item.imageView?.image)!
        performSegue(withIdentifier: "showFood", sender: nil)
    }
}

