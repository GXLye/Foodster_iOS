//
//  Constants.swift
//  Foodster
//
//  Created by Lye Guang Xing on 11/08/2017.
//  Copyright © 2017 Stencil Code. All rights reserved.
//

import Foundation
import UIKit

public struct Constants {
    static let tasteProfile = ["Diets","Preferred Cuisines"]
    static let diets = ["Gluten-free","Halal-certified","Pork-free","Vegan","Vegetarian"]
    static let cuisines = ["Chinese","Malay","Indian","Mamak","Western","Korean","Japanese"]
    
    // User Defaults
    static let groupKey = "group.com.stencilcode.Foodster.test" // App Group
    
    static let dietsKey = "userDiets"
    static let cuisinesKey = "userCuisines"
    
    
    static let sampleRest = [Restaurant(name: "Salam Noodles", rating: 3.5, latitude: "2.926002", longitude: "101.65159", image: ""),
                             Restaurant(name: "myBurgerLab", rating: 4.7, latitude: "3.0158647", longitude: "101.5665644", image: "")]
    static let sampleFood = [Food(name: "Burger", rating: 4, image: "https://image.ibb.co/dr8Sga/my_Burger_Lab.jpg", price: 7.50, restaurant: "myBurgerLab"),
                             Food(name: "Beef Soup Noodles", rating: 4, image: "http://www.salamnoodles.com/assets/images/shop1.jpg", price: 8.00, restaurant: "Salam Noodles"),
                             Food(name: "Mushroom Beef Noodles", rating: 4, image: "http://www.salamnoodles.com/assets/images/shop5.jpg", price: 5.00, restaurant: "Salam Noodles"),
                             Food(name: "Braised Beef Noodles", rating: 3, image: "http://www.salamnoodles.com/assets/images/shop6.jpg", price: 6.00, restaurant: "Salam Noodles"),
                             Food(name: "Mutton Curry Noodles", rating: 2, image: "http://www.salamnoodles.com/assets/images/shop7.jpg", price: 7.00, restaurant: "Salam Noodles")]
    
}

class Restaurant : NSObject {
    var name : String = ""
    var latitude : String = ""
    var longitude : String = ""
    var rating : Double = 0.0
    var image : String = ""
    
    init(name: String, rating: Double, latitude: String, longitude: String, image: String) {
        self.name = name
        self.rating = rating
        self.longitude = longitude
        self.latitude = latitude
        self.image = image
    }
}

class Food : NSObject {
    var name : String = ""
    var rating : Double = 0.0
    var price : Double = 0.0
    var image : String = ""
    var restaurant : String = ""
    
    init(name: String, rating: Double, image: String, price: Double, restaurant: String) {
        self.name = name
        self.rating = rating
        self.image = image
        self.price = price
        self.restaurant = restaurant
    }
}

extension UIView {
    func pushTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        self.layer.add(animation, forKey: kCATransitionPush)
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        self.layer.add(animation, forKey: kCATransitionFade)
    }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.fadeTransition(0.3)
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
    
}

extension Double {
    var dollarString:String {
        return String(format: "$%.2f", self)
    }
    
    var noDecimal:String {
        if self > 1000.00 {
            return String(format: "%.1fkm", self/1000)
        }
        return String(format: "%.0fm", self)
    }
    
    var toSteps: String {
        return String(format: "%.0f steps", self/0.7)
    }
    
    var toPrice: String {
        return String(format: "%.2f", self)
    }
    
    var toRatings: String {
        if self <= 0.0 && self <= 0.4 {
            return "☆☆☆☆☆"
        }
        
        if self > 0.4 && self <= 1.0 {
            return "★☆☆☆☆"
        }
        
        if self > 0.4 && self <= 1.0 {
            return "★☆☆☆☆"
        }
        
        if self > 1.0 && self <= 2.0 {
            return "★★☆☆☆"
        }
        
        if self > 2.0 && self <= 3.0 {
            return "★★★☆☆"
        }
        
        if self > 3.0 && self <= 4.0 {
            return "★★★★☆"
        }
        
        if self > 4.0 && self <= 5.0 {
            return "★★★★★"
        }
        
        return "☆☆☆☆☆"
    }
}
