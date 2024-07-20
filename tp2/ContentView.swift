//
//  ContentView.swift
//  tp2
//
//  Created by Hansen Yudistira on 20/07/24.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @State private var animationFinished = false
    @StateObject private var cart = Cart()
    
    var body: some View {
            VStack {
                if animationFinished {
                    FoodListView()
                        .environmentObject(cart)
                } else {
                    LottieView(animation: .named("TP2 Logo.json"))
                        .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                        .animationDidFinish { completed in
                            if completed {
                                animationFinished = true
                            }
                        }
                }
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
}

#Preview {
    ContentView()
}
