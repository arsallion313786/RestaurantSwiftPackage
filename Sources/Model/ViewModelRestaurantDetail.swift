//
//  ViewModelRestaurantDetail.swift
//  RestaurantSwiftPackage
//
//  Created by Muhammad Arslan Khalid on 06/03/2022.
//

import Foundation

struct ViewModelRestaurantDetail {
    
    
    var imgURL:URL?{
        guard let imgURLStr = self.restaurant.image else {return nil}
        return URL(string: imgURLStr)
    }
    
    var name:String?{
        return self.restaurant.name
    }
    
    var descp:String?{
        var arr = [String?]()
        arr.append("Detail:")
        arr.append(self.restaurant.description)
        return arr.compactMap{$0}.joined(separator: "\n")
    }
    
    var hours:String?{
        var arr = [String?]()
        arr.append("Timing")
        arr.append(self.restaurant.hours)
        return arr.compactMap{$0}.joined(separator: "\n")
    }
    
    var rating:String?{
        var arr = [String]()
        arr.append("Rating")
        arr.append("\(self.restaurant.rating ?? 0.0)")
        return arr.joined(separator: "\n")
    }
    
    
    
    private (set) var restaurant:Restaurant!
    init(restaurant:Restaurant) {
        self.restaurant = restaurant
    }
}
