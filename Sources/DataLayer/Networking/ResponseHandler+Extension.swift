//
//  ResponseHandler+Extension.swift
//  CleanArchitecture
//
//  Created by Muhammad Arslan Khalid on 24/12/2021.
//

import Foundation

struct RestaurantErrorModel: Error {
    
    let errorType:ErrorType
    let message:String!
    
    
    enum ErrorType:Equatable{
        case noInternet
        case serverError(Int?)
        case apiError
        case parsingError
        case urlNotValid
    }
}

extension ResponseHandler {
    func defaultParseResponse<T:Codable>(data:Data, response:HTTPURLResponse) throws -> T {
        let jsonDecoder = JSONDecoder();
        do{
            let body  = try jsonDecoder.decode(T.self, from: data)
            if response.statusCode == 200{
                return body
            }
            else{
                throw RestaurantErrorModel(errorType: .serverError(response.statusCode), message: "Unknown Error")
            }
        } catch{
            throw RestaurantErrorModel(errorType: .parsingError, message: error.localizedDescription)
        }
    }
}
