//
//  WebService.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import Foundation
import Moya


enum NetworkServices {
    
    case todoList

}

extension NetworkServices: TargetType {
    
    var baseURL: URL {
        switch self {
        case .todoList:
            return URL(string: "https://jsonplaceholder.typicode.com/")!
        }
        
    }
    
    var path: String {
        switch self {
        case .todoList:
            return "todos/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        
        case .todoList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        
        case .todoList:
            return .requestPlain
        
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .todoList :
            return [:]
        
        }
    }
}
