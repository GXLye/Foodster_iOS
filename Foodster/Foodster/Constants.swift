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
    static let cuisines = ["Chinese","Malay","Indian","Mamak","Western","Korean","Japanese", "Thai"]
    static let tags = ["Halal","Vegetarian","Japanese","Korean","Malaysian","Chinese","Indian","Western","Thai"]
    static let tagID = [1,2,3,4,5,6,7,8,9]
    
    // User Defaults
    static let groupKey = "group.com.stencilcode.Foodster.test" // App Group
    
    static let dietsKey = "userDiets"
    static let cuisinesKey = "userCuisines"
    
    // Realm
    static let syncURL = "192.168.1.208"
    static let username = "gxlye@me.com"
    static let password = "doraemon"
    
    // Sample Data
    static let sampleRest = [Restaurant(name: "myBurgerLab", rating: 4.7, latitude: "3.0158647", longitude: "101.5665644", image: ""),
                             Restaurant(name: "Salam Noodles", rating: 3.5, latitude: "2.926002", longitude: "101.65159", image: ""),
                             Restaurant(name: "Volcano Shabu Shabu Buffet", rating: 3.5, latitude: "2.9234974", longitude: "101.6601773", image: ""),
                             Restaurant(name: "Kung Fu Restaurant", rating: 3.5, latitude: "2.926002", longitude: "101.65159", image: ""),
                             Restaurant(name: "Monjo Coffee", rating: 3.5, latitude: "2.9233064", longitude: "101.6586543", image: ""),
                             Restaurant(name: "Kohyang", rating: 2.5, latitude: "2.9234436", longitude: "101.6593024", image: ""),
                             Restaurant(name: "Aroii Thai", rating: 1.5, latitude: "2.923352", longitude: "101.656470", image: "")]
    static let sampleFood = [Food(name: "Burger", rating: 4, image: "https://image.ibb.co/dr8Sga/my_Burger_Lab.jpg", price: 7.50, restaurant: "myBurgerLab", tags: ""),
                             Food(name: "Beef Soup Noodles", rating: 4, image: "http://www.salamnoodles.com/assets/images/shop1.jpg", price: 8.00, restaurant: "Salam Noodles", tags: ""),
                             Food(name: "Mushroom Beef Noodles", rating: 4, image: "http://www.salamnoodles.com/assets/images/shop5.jpg", price: 5.00, restaurant: "Salam Noodles", tags: ""),
                             Food(name: "Braised Beef Noodles", rating: 3, image: "http://www.salamnoodles.com/assets/images/shop6.jpg", price: 6.00, restaurant: "Salam Noodles", tags: ""),
                             Food(name: "Mutton Curry Noodles", rating: 2, image: "http://www.salamnoodles.com/assets/images/shop7.jpg", price: 7.00, restaurant: "Salam Noodles", tags: ""),
                             Food(name: "Volcano Shabu Shabu Buffet", rating: 2, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/15978103_1848989638675162_219536827670303168_n.jpg?oh=7720b55272ac785bed90af27fc0d3d8d&oe=5A22FFB7", price: 7.00, restaurant: "Volcano Shabu Shabu Buffet", tags: ""),
                             
                             Food(name: "Indonesian Fried Sotong", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/10424416_333637746785898_8456282111508033202_n.jpg?oh=548497189d0c285ce33b4cd1185f9c38&oe=59F46819", price: 7.00, restaurant: "Kung Fu Restaurant", tags: ""),
                             Food(name: "Coconut 'Kampung Chicken' Soup", rating: 3, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/10351090_336472766502396_1397057044746930664_n.jpg?oh=14a162041d74be7357b2d04981f8fdb4&oe=5A38DC9D", price: 7.00, restaurant: "Kung Fu Restaurant", tags: ""),
                             Food(name: "Preserved Vegetables & Pork Rice", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/10273505_314344262048580_3860773085661761102_n.jpg?oh=1d85c7c813579da130934cbcce835e79&oe=5A279594", price: 7.00, restaurant: "Kung Fu Restaurant", tags: ""),
                             
                             Food(name: "Crispy Chicken Burger", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/18557138_774320859405521_4169112356328076996_n.jpg?oh=52b837619e1f6e0d2501108a9432b553&oe=5A2561C0", price: 7.00, restaurant: "Monjo Coffee", tags: ""),
                             Food(name: "Monjo Club Sandwich", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/18275076_767272536777020_2053524224938384378_n.jpg?oh=5aae9d1e4b0db11bfaf29639ebfc47ab&oe=5A2C73D3", price: 7.00, restaurant: "Monjo Coffee", tags: ""),
                             Food(name: "Pineapple Beef Salad", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/15338884_690133344490940_2623362440675089145_n.jpg?oh=338c61a9031c68da52e902dcaab2acd7&oe=59F326FB", price: 7.00, restaurant: "Monjo Coffee", tags: ""),
                             
                             Food(name: "Tuk Man Du Guk", rating: 4, image: "http://www.kohyang.com.my/images/menu_b_14.jpg", price: 7.00, restaurant: "Kohyang", tags: ""),
                             Food(name: "Jajang Myeon", rating: 4, image: "http://www.kohyang.com.my/images/menu_b_49.jpg", price: 7.00, restaurant: "Kohyang", tags: ""),
                             Food(name: "Dol Sot Bi Bim Bab", rating: 4, image: "http://www.kohyang.com.my/images/menu_b_15.jpg", price: 7.00, restaurant: "Kohyang", tags: ""),
                             
                             Food(name: "Tom Yum Glass Noodle Soup", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/11181948_222384458105697_963946925573895212_n.jpg?oh=130f62658a1fb607091bfba72b880dcb&oe=5A2C5188", price: 7.00, restaurant: "Aroii Thai", tags: ""),
                             Food(name: "Vegetarian Spicy Spring Roll", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/12654232_222384451439031_4364556327925280180_n.jpg?oh=eef3e87a8444dba79cd0fba572bc49a8&oe=5A29EE15", price: 7.00, restaurant: "Aroii Thai", tags: "Vegetarian"),
                             Food(name: "Chicken Glass Noodle Soup", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/12631435_222384224772387_794392629788847208_n.jpg?oh=14009ee20984d39c0d150a3b65360399&oe=59F711B4", price: 7.00, restaurant: "Aroii Thai", tags: ""),
                             Food(name: "Green Papaya Salad", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/12644681_222384271439049_3165451325673712194_n.jpg?oh=76242ec9178826fb75ac23c8824ade49&oe=5A34EB66", price: 7.00, restaurant: "Aroii Thai", tags: "Vegetarian"),
                             Food(name: "Lemongrass Drink", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/12687967_222384304772379_909033313452959002_n.jpg?oh=0e528340aa652e8eb390c65b93e14a08&oe=59F48456", price: 7.00, restaurant: "Aroii Thai", tags: "Vegetarian"),
                             Food(name: "Mango Sticky Rice", rating: 4, image: "https://scontent.fkul8-1.fna.fbcdn.net/v/t1.0-9/12592493_222384314772378_1552094407746597721_n.jpg?oh=3f82b63104bb142ab9223197210f8232&oe=5A27BB45", price: 4.00, restaurant: "Aroii Thai", tags: "Vegetarian")]
    
}

class Restaurant : NSObject {
    var name : String = ""
    var latitude : String = ""
    var longitude : String = ""
    var rating : Double = 0.0
    var image : String = ""
    var detail : String = ""
    
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
    var tags : String = ""
    var detail : String = ""
    
    init(name: String, rating: Double, image: String, price: Double, restaurant: String, tags: String) {
        self.name = name
        self.rating = rating
        self.image = image
        self.price = price
        self.restaurant = restaurant
        self.tags = tags
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
