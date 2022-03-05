//
//  RestaurantsAPI.swift
//  RestaurantChallange
//
//  Created by Muhammad Arslan Khalid on 12/02/2022.
//

import Foundation

struct RestaurantsAPI : APIHandler{
    
    func makeRequest(from param:[String:Any]) -> URLRequest? {
        let urlString = Path().restaurants;
        if var url = URL(string: urlString){
            if param.count > 0 {
                url = setQueryParams(parameters: param, url: url);
            }
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest;
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [Restaurant] {
        return try defaultParseResponse(data: data, response: response)
    }
    
    
}
