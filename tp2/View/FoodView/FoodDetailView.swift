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
    @State private var showMessage = false
    @State private var message = ""
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
                showMessage = true
                message = "Makanan berhasil ditambahkan ke keranjang"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showMessage = false
                }
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
        .overlay(
            VStack {
                if showMessage {
                    Text(message)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .transition(.opacity)
                }
            }
            .padding()
            , alignment: .bottom
        )
    }
}
