//
//  ViewModelRestaurant.swift
//  RestaurantSwiftPackage
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import Foundation
struct ViewModelRestaurant:Hashable {
    
    static func == (lhs: ViewModelRestaurant, rhs: ViewModelRestaurant) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.distance == rhs.distance && lhs.imgURL == rhs.imgURL && lhs.restaurant == rhs.restaurant
    }
    
    
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(id);
    }
   
    var id:Int{
        return self.restaurant.id!;
    }
    
    var name:String?{
        return self.restaurant.name;
    }
    
    var distance:String?{
        guard let val = self.restaurant.distance else {
            return nil
        }
        return "Distance: \(String(format: "%.1f", val))"
    }
    var imgURL:URL?{
        guard let imgURLStr = self.restaurant.image else {return nil}
        return URL(string: imgURLStr)
    }
    
    
    private (set) var restaurant:Restaurant!
    init(restaurant:Restaurant) {
        self.restaurant = restaurant
    }
}
