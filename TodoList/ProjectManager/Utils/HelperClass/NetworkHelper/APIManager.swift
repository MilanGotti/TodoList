//
//  APIManager.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import Foundation

import Moya

class APIManager {
    let Provider = MoyaProvider<NetworkServices>()
    private static var instance = APIManager()
    
    
    public static var shared: APIManager {
        return instance
    }
    
    //MARK:- Login
    func todoList(finalresult:@escaping (Result<Todos,ErrorModel>)-> Void) {
        Provider.request(.todoList) { (response) in
            self.processResponse(result: response, completion: finalresult)
        }
    }
    
    

}
extension APIManager {
    func processResponse<T>(result:Result<Moya.Response,MoyaError>,completion: (Result<T,ErrorModel>) -> ()) where T: Codable {
        switch result {
        case .success(let response):
            do {
                print(try response.mapJSON())
            }catch(let error) {
                print(error)
            }
            switch response.statusCode {
            case 200...209:
                do {
                    let json = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(json))
                }catch (let error) {
                    completion(.failure(.unknown(error: error.localizedDescription)))
                }
            case 401...499:
                completion(.failure(ErrorModel.unauthorized))
            case 500...599:
                completion(.failure(ErrorModel.serverError))
            default:
                completion(.failure(ErrorModel.serverError))
            }
        case .failure(let error):
            completion(.failure(.unknown(error: error.localizedDescription)))
        }
    }
}
