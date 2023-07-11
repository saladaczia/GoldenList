//
//  ItemsModel.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 11/07/2023.
//

import Foundation

// Item Model
struct ItemsModel: Identifiable, Codable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
