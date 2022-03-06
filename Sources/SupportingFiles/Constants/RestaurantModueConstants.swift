//
//  RestaurantModueConstatn.swift
//  RestaurantSwiftPackage
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import Foundation
import UIKit
struct RestaurantModueConstants {
   
    struct AppImages {
        static let generalPlaceHolderImage = UIImage(named: "placeholder-image", in: Bundle(for: RestaurantListingVC.self), compatibleWith: nil);
    }
    
    
    struct APIHeaders{
        static var kContentType = "Content-Type"
        static var contentTypeValue = "application/json"
    }
    
}

