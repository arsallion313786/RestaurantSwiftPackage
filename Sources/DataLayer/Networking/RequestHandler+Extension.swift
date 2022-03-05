//
//  RequestHandler+Extension.swift
//  CleanArchitecture
//
//  Created by Muhammad Arslan Khalid on 24/12/2021.
//

import Foundation
extension RequestHandler {
    func set(parametes:[String:Any], urlRequest: inout URLRequest){
        if parametes.count != 0{
            if let jsonData = try? JSONSerialization.data(withJSONObject: parametes, options: []){
                urlRequest.httpBody = jsonData;
            }
        }
    }
    
    func setQueryParams(parameters:[String:Any], url:URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map {element in URLQueryItem(name: element.key, value: String(describing: element.value))}
        return components?.url ?? url;
    }
    
    func setDefaultHeaders(request: inout URLRequest){
        request.setValue(RestaurantModueConstants.APIHeaders.kContentType, forHTTPHeaderField: RestaurantModueConstants.APIHeaders.contentTypeValue)
    }
}
