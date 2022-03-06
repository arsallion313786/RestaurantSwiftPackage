//
//  RestaurantContentConfiguration.swift
//  RestaurantModule
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import Foundation
import UIKit

struct RestaurantContentConfiguration: UIContentConfiguration, Hashable {
    
    var name: String?
    var distance:String?
    var restaurantImageURL: URL?
    
    func makeContentView() -> UIView & UIContentView {
        return RestaurantListingContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
    
    
    
}
