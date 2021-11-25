//
//  TodoDetailsModel.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import Foundation

// MARK: - TodoDetails
struct TodoDetails: Codable {
    let userID, id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias Todos = [TodoDetails]
