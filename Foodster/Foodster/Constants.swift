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
    static let diets = ["Gluten-free","Halal","Pork-free","Vegan","Vegetarian"]
    static let cuisines = ["Chinese","Malay","Indian","Mamak","Western","Korean","Japanese"]
    
    // User Defaults
    static let groupKey = "group.com.stencilcode.Foodster.test" // App Group
    
    static let dietsKey = "userDiets"
    static let cuisinesKey = "userCuisines"
    
    
    static let sampleRest = [Restaurant(name: "Salam Noodles", latitude: "2.926002", longitude: "101.65159", image: ""),
                             Restaurant(name: "myBurgerLab", latitude: "3.0158647", longitude: "101.5665644", image: ""),
                             Restaurant(name: "Salam Noodles", latitude: "2.926002", longitude: "101.65159", image: ""),
                             Restaurant(name: "Salam Noodles", latitude: "2.926002", longitude: "101.65159", image: "")]
    
}

class Restaurant : NSObject {
    var name : String = ""
    var latitude : String = ""
    var longitude : String = ""
    var image : String = ""
    
    init(name: String, latitude: String, longitude: String, image: String) {
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.image = image
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
