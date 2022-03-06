//
//  RestaurantListCell.swift
//  RestaurantSwiftPackage
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import Foundation
import UIKit
class RestaurantListCell: UICollectionViewListCell {
    
    var item: ViewModelRestaurant?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
    
        self.updateConentConfiguration(state: state);
        self.updateBackgroundConfiguration();
    }
}


extension RestaurantListCell{
    func updateConentConfiguration(state: UICellConfigurationState){
        var newConfiguration = RestaurantContentConfiguration().updated(for: state)
        
        newConfiguration.name = item?.name
        newConfiguration.restaurantImageURL = item?.imgURL;
        newConfiguration.distance = item?.distance;
        
        
        contentConfiguration = newConfiguration
    }
    
    func updateBackgroundConfiguration(){
        var newBgConfiguration = UIBackgroundConfiguration.listGroupedCell()
                newBgConfiguration.backgroundColor = .systemBackground
                backgroundConfiguration = newBgConfiguration
    }
}
