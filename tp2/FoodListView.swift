//
//  FoodListView.swift
//  tp2
//
//  Created by Hansen Yudistira on 20/07/24.
//

import SwiftUI

struct FoodListView: View {
    @StateObject private var cart = Cart()
    @State private var showCart = false
    
    var foodItems = [
        FoodItem(id: UUID(), imageName: "food1", title: "Pasta", description: "Mie ala Itali", price: 80000),
        FoodItem(id: UUID(), imageName: "food2", title: "Paket anak kos", description: "Indomie dengan topping telur ceplok", price: 10000),
        FoodItem(id: UUID(), imageName: "food3", title: "Mie Ayam", description: "Mie dengan topping Ayam", price: 15000)
    ]
    
    var body: some View {
        NavigationView {
            List(foodItems) { food in
                NavigationLink(destination: FoodDetailView(food: food)) {
                    FoodCardView(food: food)
                }
            }
            .navigationTitle("Daftar Makanan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCart.toggle()
                    }) {
                        Image(systemName: "cart")
                    }
                }
            }
            .sheet(isPresented: $showCart) {
                CartView()
                    .environmentObject(cart)
            }
        }
        .environmentObject(cart)
    }
}


#Preview {
    FoodListView()
}
