//
//  FoodDetailView.swift
//  tp2
//
//  Created by Hansen Yudistira on 20/07/24.
//

import SwiftUI

struct FoodDetailView: View {
    @EnvironmentObject var cart: Cart
    @State private var showCart = false
    var food: FoodItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(food.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
            
            Text(food.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(food.description)
                .font(.body)
            
            Text("Harga: Rp.\(food.price, specifier: "%.2f")")
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button(action: {
                cart.addItem(food)
            }) {
                Text("Tambahkan ke keranjang")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle(food.title)
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
}
