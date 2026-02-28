//
//  ContentView.swift
//  iOS_Adv_lab2
//
//  Created by Zhaniya Utemuratova on 28.02.2026.
//

import SwiftUI

// MARK: - Data Model
struct FavoriteItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let emoji: String
    var isFavorite: Bool = false
}

// MARK: - ContentView
struct ContentView: View {

    // MARK: - @State Data (4 sections, 10 items each)
    @State private var cosmetics: [FavoriteItem] = [
        FavoriteItem(title: "Dior Backstage Foundation", subtitle: "Lightweight natural finish", emoji: "🧴"),
        FavoriteItem(title: "Rare Beauty Blush", subtitle: "Soft Pinch Liquid Blush", emoji: "🌸"),
        FavoriteItem(title: "Charlotte Tilbury Airbrush Powder", subtitle: "Flawless finish", emoji: "✨"),
        FavoriteItem(title: "Fenty Beauty Gloss Bomb", subtitle: "Universal lip gloss", emoji: "💄"),
        FavoriteItem(title: "Maybelline Sky High Mascara", subtitle: "Length & volume", emoji: "👁️"),
        FavoriteItem(title: "NARS Radiant Concealer", subtitle: "Medium buildable coverage", emoji: "🎨"),
        FavoriteItem(title: "MAC Velvet Teddy Lipstick", subtitle: "Classic nude shade", emoji: "💋"),
        FavoriteItem(title: "Benefit Hoola Bronzer", subtitle: "Matte bronzing powder", emoji: "☀️"),
        FavoriteItem(title: "Huda Beauty Eyeshadow Palette", subtitle: "Highly pigmented shades", emoji: "🎭"),
        FavoriteItem(title: "Rare Beauty Highlighter", subtitle: "Silky liquid glow", emoji: "🌟")
    ]

    @State private var skincare: [FavoriteItem] = [
        FavoriteItem(title: "CeraVe Hydrating Cleanser", subtitle: "Gentle daily wash", emoji: "🫧"),
        FavoriteItem(title: "La Roche-Posay Effaclar Duo", subtitle: "Anti-acne treatment", emoji: "🧪"),
        FavoriteItem(title: "COSRX Snail Mucin Essence", subtitle: "Deep hydration", emoji: "🐌"),
        FavoriteItem(title: "Laneige Lip Sleeping Mask", subtitle: "Overnight lip care", emoji: "💧"),
        FavoriteItem(title: "Round Lab Birch Juice Sunscreen", subtitle: "Lightweight SPF", emoji: "☀️"),
        FavoriteItem(title: "The Ordinary Niacinamide", subtitle: "Oil control serum", emoji: "🔬"),
        FavoriteItem(title: "Beauty of Joseon Glow Serum", subtitle: "Propolis + niacinamide", emoji: "🍯"),
        FavoriteItem(title: "Dr. Jart+ Cicapair Cream", subtitle: "Soothing redness care", emoji: "🌿"),
        FavoriteItem(title: "Innisfree Clay Mask", subtitle: "Pore tightening", emoji: "🧖‍♀️"),
        FavoriteItem(title: "Avène Thermal Water", subtitle: "Calming mist", emoji: "💦")
    ]

    @State private var hairCare: [FavoriteItem] = [
        FavoriteItem(title: "Olaplex No.3", subtitle: "Hair repair treatment", emoji: "🧴"),
        FavoriteItem(title: "Kérastase Nutritive Shampoo", subtitle: "Dry hair nourishment", emoji: "🫧"),
        FavoriteItem(title: "L’Oréal Elvive Conditioner", subtitle: "Affordable hydration", emoji: "💧"),
        FavoriteItem(title: "Moroccanoil Treatment", subtitle: "Argan oil shine", emoji: "✨"),
        FavoriteItem(title: "Davines OI Oil", subtitle: "Softness & fragrance", emoji: "🌼"),
        FavoriteItem(title: "Pantene Hair Mask", subtitle: "Weekly repair", emoji: "🛁"),
        FavoriteItem(title: "Mielle Rosemary Oil", subtitle: "Scalp growth oil", emoji: "🌿"),
        FavoriteItem(title: "Redken Acidic Bonding", subtitle: "Damage repair system", emoji: "🔗"),
        FavoriteItem(title: "Briogeo Don’t Despair Mask", subtitle: "Deep conditioning", emoji: "🥥"),
        FavoriteItem(title: "Tangle Teezer Spray", subtitle: "Leave-in detangler", emoji: "🪮")
    ]

    @State private var hairStylers: [FavoriteItem] = [
        FavoriteItem(title: "Dyson Airwrap", subtitle: "Multi-styler curls & volume", emoji: "💨"),
        FavoriteItem(title: "Dyson Supersonic Dryer", subtitle: "Fast drying", emoji: "🌪️"),
        FavoriteItem(title: "GHD Platinum+ Straightener", subtitle: "Smart heat styling", emoji: "📏"),
        FavoriteItem(title: "Babyliss Curling Wand", subtitle: "Loose waves", emoji: "🌀"),
        FavoriteItem(title: "Revlon One-Step Volumizer", subtitle: "Blow-dry brush", emoji: "🪮"),
        FavoriteItem(title: "Philips Heated Brush", subtitle: "Smooth styling", emoji: "🔥"),
        FavoriteItem(title: "Remington Silk Straightener", subtitle: "Affordable flat iron", emoji: "✨"),
        FavoriteItem(title: "Hot Tools Curling Iron", subtitle: "Salon curls", emoji: "🎀"),
        FavoriteItem(title: "Shark FlexStyle", subtitle: "Dyson alternative", emoji: "🦈"),
        FavoriteItem(title: "Mini Travel Straightener", subtitle: "Compact styling", emoji: "✈️")
    ]

    // MARK: - Derived values
    private var totalItemCount: Int {
        cosmetics.count + skincare.count + hairCare.count + hairStylers.count
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Cosmetics") {
                    ForEach($cosmetics) { $item in
                        FavoriteRow(item: $item)
                    }
                }

                Section("Skin-care") {
                    ForEach($skincare) { $item in
                        FavoriteRow(item: $item)
                    }
                }

                Section("Hair-care") {
                    ForEach($hairCare) { $item in
                        FavoriteRow(item: $item)
                    }
                }

                Section("Hair stylers") {
                    ForEach($hairStylers) { $item in
                        FavoriteRow(item: $item)
                    }
                }

                Section {
                    HStack {
                        Text("Total items")
                        Spacer()
                        Text("\(totalItemCount)")
                            .fontWeight(.semibold)
                    }
                }
            }
            .navigationTitle("Beauty Products")
        }
    }
}


private struct FavoriteRow: View {
    @Binding var item: FavoriteItem

    var body: some View {
        HStack(spacing: 12) {
            Text(item.emoji)
                .font(.system(size: 28))

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.headline)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // Optional task: heart toggle
            Button {
                item.isFavorite.toggle()
            } label: {
                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(item.isFavorite ? Color(red: 234 / 255, green: 126 / 255, blue: 163 / 255) : .gray)
            }
            .buttonStyle(.plain)
            .buttonStyle(.plain)
            .accessibilityLabel(item.isFavorite ? "Remove from favorites" : "Mark as favorite")
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    ContentView()
}
