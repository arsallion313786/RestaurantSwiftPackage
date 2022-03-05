//
//  APIPath.swift
//  CleanArchitecture
//
//  Created by Muhammad Arslan Khalid on 24/12/2021.
//

import Foundation

#if DEBUG
let environment = Environment.development
#else
let environment = Environment.production
#endif

let baseURL = environment.baseURL()

struct Path{
    var restaurants:String {return "\(baseURL)\(environment.route())/restaurants.json"}
}
