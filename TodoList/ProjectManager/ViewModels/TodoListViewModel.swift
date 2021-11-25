//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import Foundation

class TodoListViewModel {
    
    //MARK: Variables
    var todoListArray = [TodoDetails]()
    
    //MARK: Fetch Todo list
    func getToloList(completion:@escaping(Bool, String)->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            completion(false, errorMessage.noInternet.rawValue)
            return
        }
        
        APIManager.shared.todoList { (response) in
            switch response {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let response) :
                self.todoListArray = response
                completion(true, "")
            }
        }
    }
    
    
}
