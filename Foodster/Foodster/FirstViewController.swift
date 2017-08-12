//
//  FirstViewController.swift
//  Foodster
//
//  Created by Lye Guang Xing on 11/08/2017.
//  Copyright © 2017 Stencil Code. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import RealmSwift

class FirstViewController: UIViewController, UITableViewDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var annotations: [MKPointAnnotation] = []
    var selectedFood = Food(name: "", rating: 0.0, image: "", price: 0.0, restaurant: "", tags: "")
    var selectedImage = UIImageView()
    
    var restaurantFoodResult = [[Food]]()
    var restaurantResult = [Restaurant]()
    var foodResult = [Food]()
    var restaurants: [String] = []
    
    var realm: Realm!
    var notificationToken: NotificationToken!
    //let user = SyncUser.current!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mapView.delegate = self
        
        /*downloadTags(contentID: "", completion: { tag in
            print(tag)
        })*/
        
        //setupRealm()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        
        var vegetarian = false
        
        if let diets = UserDefaults.init(suiteName: Constants.groupKey)?.value(forKey: Constants.dietsKey) as? [String] {
            print(diets)
            
            for diet in diets {
                if diet == "Vegetarian" {
                    vegetarian = true
                    print(vegetarian)
                }
            }
        }
        
        if let cuisines = UserDefaults.init(suiteName: Constants.groupKey)?.value(forKey: Constants.cuisinesKey) as? [String] {
            print(cuisines)
        }
        
        

        // Load Data
        restaurants = []
        restaurantResult = Constants.sampleRest
        foodResult = Constants.sampleFood
        
        var restaurantName = ""
        
        for food in foodResult {
            if restaurantName != food.restaurant {
                restaurants.append(food.restaurant) // Assuming all food arranged according to restaurant
                restaurantName = food.restaurant
            }
        }
        
        for restaurant in restaurants {
            var foodArr: [Food] = []
            for food in foodResult {
                if food.restaurant == restaurant {
                    if vegetarian {
                        if food.tags.contains("Vegetarian") {
                            foodArr.append(food)
                        }
                    } else {
                        foodArr.append(food)
                    }
                }
            }
            
            restaurantFoodResult.append(foodArr)
        }
        
        tableView.reloadData()
        
        mapView.removeAnnotations(annotations)
        annotations = []
        
        for restaurant in restaurantResult {
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
        
        vegetarian = false
    }
    
    func setupRealm() {
        
        SyncUser.logIn(with: .usernamePassword(username: Constants.username, password: Constants.password, register: false), server: URL(string: "http://\(Constants.syncURL):9080")!) { user, error in guard let user = user else {
            fatalError(String(describing: error))
            }
            
            DispatchQueue.main.async {
                // Open Realm
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://\(Constants.syncURL):9080/hok")!)
                )
                self.realm = try! Realm(configuration: configuration)
                
            }
        }
    }
    
    deinit {
        notificationToken.stop()
    }
    
    func downloadTags(contentID: String, completion: @escaping ([String]) -> Void) {
        Alamofire.request(
            "http://foodster.azurewebsites.net/api/Places"//,
            //parameters: ["content": contentID],
            //headers: ["Authorization": "Basic xxx"]
            )
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags")
                    completion([String]())
                    return
                }
                
                guard let responseJSON = response.result.value as? [String: Any] else {
                    print("Invalid tag information received from the service")
                    completion([String]())
                    return
                }
                
                print(responseJSON)
                completion([String]())
        }
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
            
            foodView.selectedFood = selectedFood
            
            //navigationController?.transitioningDelegate = self.transitionManager
        }
    }
    
    @IBAction func search(_ sender: Any) {
        tableView.reloadData()
    }
}

extension FirstViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
//        return restaurantResult.count
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantFoodResult[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return restaurantResult[section].name
        return restaurants[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let food = restaurantFoodResult[indexPath.section][indexPath.row]
        
        item.textLabel?.text = food.name
        item.detailTextLabel?.text = food.tags
        item.imageView?.image = UIImage(named: "Blank")
        item.imageView?.downloadedFrom(link: food.image, contentMode: .scaleAspectFill)
        
        return item
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        
        selectedFood = self.restaurantFoodResult[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "showFood", sender: nil)
        
        
    }
}

