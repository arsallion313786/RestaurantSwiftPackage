//
//  AppUtils.swift
//  PokemonDemo
//
//  Created by Muhammad Arslan Khalid on 13/02/2022.
//

import Foundation
import UIKit

let appUtility = RestaurantUtility.shared

class RestaurantUtility:NSObject{
    static let shared = RestaurantUtility()
    private var reachability =  try! Reachability()
    
    private override init() {
        super.init();
    }
}

extension RestaurantUtility{
    func isInternetReachable() -> Bool {
        return self.reachability.connection != .unavailable
    }
}
