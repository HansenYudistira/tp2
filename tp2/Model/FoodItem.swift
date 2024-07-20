//
//  FoodItem.swift
//  tp2
//
//  Created by Hansen Yudistira on 20/07/24.
//

import Foundation

struct FoodItem: Identifiable {
    let id: UUID
    let imageName: String
    let title: String
    let description: String
    let price: Double
}
