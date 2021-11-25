//
//  Enums.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import Foundation


enum TaskStatus : String {
    case complete = "Complete"
    case incomplete = "Incomplete"
}


enum CellIdentifiers : String {
   
    case TodoItemCell = "TodoItemCell"
    case TodoItemHeaderView = "TodoItemHeaderView"
    
}

enum ControllerIdentifiers : String {
    case TodoDetailsViewController = "TodoDetailsViewController"
    case TodoListViewController = "TodoListViewController"
    case GlobalSplitViewController = "GlobalSplitViewController"
}

enum SuccessStatus : String {
    case success = "Success"
    case error = "Error"
}
