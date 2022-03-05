//
//  RestaurantAppDependecyContainer.swift
//  RestaurantChallangeApp
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import UIKit
import RestaurantSwiftPackage

class RestaurantAppDependecyContainer: NSObject {
    
    func rootVC() ->  UIViewController{
        return self.getRastaurantListingWithNavigationVC();
    }
    
    private func getRastaurantListingWithNavigationVC() -> UINavigationController{
        return UINavigationController(rootViewController: RestaurantListingVC())
    }
    

}
