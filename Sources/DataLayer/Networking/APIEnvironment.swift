//
//  APIEnvironment.swift
//  RestaurantSwiftPackage
//
//  Created by Muhammad Arslan Khalid on 12/02/2022.
//

import Foundation

enum Environment {
    case development
    case production
    
    func baseURL () -> String{
        return "https://\(domain())"
    }
    
    
    func domain () -> String {
        switch(self){
        case .development:
            return "jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com";
        case .production:
            return "jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com";
        }
    }
    
    func subdomain() -> String{
        switch(self){
        case .development, .production:
            return "";
        }
    }
    
    func route() -> String {
        return ""
    }
    
}
