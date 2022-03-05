//
//  APILoader.swift
//  CleanArchitecture
//
//  Created by Muhammad Arslan Khalid on 24/12/2021.
//

import Foundation

class APILoader<T: APIHandler>{
    let apiRequest: T
    let urlSession:URLSession
    
    init(apiRequest: T, urlSession:URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadRequest(requestData:T.RequestDataType) async throws -> T.ResponsetDataType?{
        
        guard appUtility.isInternetReachable() else {
            
            throw RestaurantErrorModel(errorType: .noInternet, message: "No internet connection found");
        }
        if let urlRequest = apiRequest.makeRequest(from: requestData){
            
            do{
                let (data, response) = try await urlSession.data(for: urlRequest, delegate: nil);
                guard let httpResponse = response as? HTTPURLResponse else{
                    throw RestaurantErrorModel(errorType: .serverError(0), message: "Got response nil")
                }
                
                do{
                    let parseResponse = try self.apiRequest.parseResponse(data: data, response: httpResponse)
                    return parseResponse
                }
                catch let parserError {
                    throw parserError;
                }
                
            }
            catch let error
            {
                throw RestaurantErrorModel(errorType: .serverError(0), message: error.localizedDescription)
            }
            
           
        }
        else{
            throw RestaurantErrorModel(errorType: .urlNotValid, message: "Request not valid");
        }
    }
}
