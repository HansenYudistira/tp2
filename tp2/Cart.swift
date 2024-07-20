//
//  Cart.swift
//  tp2
//
//  Created by Hansen Yudistira on 20/07/24.
//

import Foundation
import SwiftUI
import Combine

class Cart: ObservableObject {
    @Published var items: [FoodItem] = []
    
    func addItem(_ item: FoodItem) {
        items.append(item)
    }
}
