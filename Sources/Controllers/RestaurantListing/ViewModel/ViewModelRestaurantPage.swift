//
//  ViewModelRestaurantPage.swift
//  RestaurantSwiftPackage
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import Foundation
import Combine

class ViewModelRestaurantPage:NSObject{
    
    var isLoading = PassthroughSubject<Bool, Never>()
    var reloadUI = PassthroughSubject<Bool, Never>()
    var errorHandler = PassthroughSubject<RestaurantErrorModel, Never>()
    private (set) var restaurants = [ViewModelRestaurant]();
    
    private var restaurantRepo:RestaurantRepo!
    
    init(restaurantRepo:RestaurantRepo) {
        self.restaurantRepo = restaurantRepo;
    }
}

extension ViewModelRestaurantPage {
    
    func parseRestaurantResponse(restautants:[Restaurant]){
        let sortedRestaurants = self.sortRestaurantListOnDistance(restaurants: restautants);
        self.restaurants  = sortedRestaurants.map{ViewModelRestaurant(restaurant: $0)}
        self.reloadUI.send(true);
    }
    func sortRestaurantListOnDistance(restaurants:[Restaurant]) -> [Restaurant] {
       return restaurants.sorted { lhs, rhs in
           return (lhs.distance ?? 0.0) < (rhs.distance ?? 0.0)
        }
    }
}

extension ViewModelRestaurantPage{
    func fetchRestaurantList(){
            Task{
                do{
                    self.isLoading.send(true)
                    let result = try await self.restaurantRepo.getRestaurants();
                    self.isLoading.send(false)
                    self.parseRestaurantResponse(restautants: result);
                   
                }
                catch let error {
                    self.isLoading.send(false)
                    self.errorHandler.send((error as! RestaurantErrorModel))
                }
            }
        
    }
}
