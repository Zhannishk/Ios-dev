//
//  ContentView.swift
//  iOS_Adv_lab1
//
//  Created by Zhaniya Utemuratova on 28.02.2026.
//

import SwiftUI

struct ContentView: View {
    let itemNames = [
        "Golden Retriever",
        "Panda",
        "Koala",
        "Dolphin",
        "Red Fox",
        "Hedgehog"
    ]
    
    let itemIcons = ["1","2","3","4","5","6"]
    
    let itemDescriptions = [
        "Friendly and loyal dogs known for their intelligence and love for people.",
        "Gentle bamboo lovers that spend most of their time eating and sleeping.",
        "Sleepy tree-dwellers famous for hugging eucalyptus branches.",
        "Highly intelligent marine mammals known for playful behavior.",
        "Clever and adaptable animals with beautiful fiery fur.",
        "Tiny nocturnal creatures that curl into a spiky ball when scared."
    ]
    
    let itemRatings = [5, 5, 4, 4, 3, 5]
    
    @State private var currentIndex = 0
    @State private var tapCount = 0
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            // Icon
            Image(itemIcons[currentIndex])
                .resizable()
                .scaledToFill()
                .frame(width:300,height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 70))
                .scaleEffect(isAnimating ? 1.15 : 1.0)
            
            // Name
            Text(itemNames[currentIndex])
                .font(.title)
                .bold()
            
            Divider()
                .padding(.horizontal)
            
            // Description
            Text(itemDescriptions[currentIndex])
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Rating
            if itemRatings[currentIndex] > 0 {
                Text("Cuteness: \(String(repeating: "🐾", count: itemRatings[currentIndex]))")
                    .font(.headline)
            } else {
                Text("Cuteness: None")
                    .foregroundColor(.gray)
            }
//            Spacer()
            // Button
            Button("Surprise Me!") {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    isAnimating = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isAnimating = false
                }
                
                var newIndex: Int
                repeat {
                    newIndex = Int.random(in: 0..<itemNames.count)
                } while newIndex == currentIndex
                
                currentIndex = newIndex
                tapCount += 1
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            .padding(.top)
            
            Spacer()
            
            // Tap counter
            Text("Cards explored: \(tapCount)")
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
