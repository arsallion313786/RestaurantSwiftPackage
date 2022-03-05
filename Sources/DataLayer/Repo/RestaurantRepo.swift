//
//  RestaurantRepo.swift
//  RestaurantModule
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import Foundation
import Combine
class RestaurantRepo {
    
    
    func getRestaurants() async throws -> [Restaurant]{
       
       
           let request = RestaurantsAPI()
           let apiLoader = APILoader(apiRequest: request)
        
        do{
            let restaurants = try await apiLoader.loadRequest(requestData:[:]);
            return restaurants ?? [];
        }
        catch let error {
            throw error;
        }
       
   }
}
