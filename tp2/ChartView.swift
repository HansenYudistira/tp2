//
//  ChartView.swift
//  tp2
//
//  Created by Hansen Yudistira on 20/07/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {
                    Text("Keranjang Anda kosong.")
                        .font(.title)
                        .foregroundColor(.gray)
                } else {
                    List(cart.items) { item in
                        HStack {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.description)
                                    .font(.subheadline)
                                Text("Rp.\(item.price, specifier: "%.2f")")
                                    .font(.subheadline)
                            }
                        }
                    }
                    Button(action: {
                        buyItems()
                    }) {
                        Text("Beli")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Keranjang")
        }
    }
    
    func buyItems() {
        cart.items.removeAll()
    }
}

