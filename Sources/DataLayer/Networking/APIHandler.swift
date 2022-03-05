//
//  APIHandler.swift
//  CleanArchitecture
//
//  Created by Muhammad Arslan Khalid on 24/12/2021.
//

import Foundation
public enum HTTPMethod:String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol RequestHandler{
    associatedtype RequestDataType
    func makeRequest(from data:RequestDataType) -> URLRequest?
}


protocol ResponseHandler{
    associatedtype ResponsetDataType
    func parseResponse(data:Data, response:HTTPURLResponse) throws -> ResponsetDataType
}

typealias APIHandler = RequestHandler & ResponseHandler
