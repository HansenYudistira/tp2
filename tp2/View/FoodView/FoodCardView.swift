//
//  FoodCardView.swift
//  tp2
//
//  Created by Hansen Yudistira on 20/07/24.
//

import SwiftUI

struct FoodCardView: View {
    var food: FoodItem
    
    var body: some View {
        HStack {
            Image(food.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                Text(food.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
