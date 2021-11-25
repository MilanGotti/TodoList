//
//  ErrorConstants.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import Foundation

enum errorMessage:String {
    
    case unAuthorized = "unauthorised user."
    case serverError = "Something went wrong with server. Please try again later."
    case noInternet = "No internet connection."
    
}

enum ErrorModel:Error {
    
    case unauthorized
    case serverError
    
    case unknown(error: String)
    func description() -> String {
        switch self {
        case .serverError:
            return errorMessage.serverError.rawValue
        case .unauthorized:
            return errorMessage.unAuthorized.rawValue
        case .unknown(let error):
            return error
        }
    }
}
