//
//  ContentView.swift
//  iOS_Adv_lab3
//
//  Created by Zhaniya Utemuratova on 07.03.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HeroViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 233/255, green: 219/255, blue: 232/255)
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    if viewModel.isLoading {
                        Spacer()
                        ProgressView("Loading hero...")
                            .font(.headline)
                        Spacer()
                    } else if let errorMessage = viewModel.errorMessage {
                        Spacer()
                        VStack(spacing: 12) {
                            Image(systemName: "wifi.exclamationmark")
                                .font(.system(size: 42))
                            Text("Something went wrong")
                                .font(.title3.bold())
                            Text(errorMessage)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.secondary)

                            Button {
                                Task {
                                    await viewModel.fetchRandomHero()
                                }
                            } label: {
                                Text("Try Again")
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(Color(red: 131/255, green: 55/255, blue: 127/255))
                                    .foregroundStyle(.white)
                                    .clipShape(Capsule())
                            }
                        }
                        .padding()
                        Spacer()
                    } else if let hero = viewModel.hero {
                        ScrollView {
                            VStack(spacing: 20) {
                                HeroHeaderView(hero: hero)

                                VStack(spacing: 12) {
                                    PowerStatRow(title: "Intelligence", value: hero.powerstats.intelligence ?? 0)
                                    PowerStatRow(title: "Strength", value: hero.powerstats.strength ?? 0)
                                    PowerStatRow(title: "Speed", value: hero.powerstats.speed ?? 0)
                                    PowerStatRow(title: "Durability", value: hero.powerstats.durability ?? 0)
                                    PowerStatRow(title: "Power", value: hero.powerstats.power ?? 0)
                                    PowerStatRow(title: "Combat", value: hero.powerstats.combat ?? 0)
                                }
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))


                                InfoCardView(title: "Biography", items: [
                                    ("Full Name", hero.biography.fullName ?? "Unknown"),
                                    ("Publisher", hero.biography.publisher ?? "Unknown"),
                                    ("Alignment", hero.biography.alignment ?? "Unknown"),
                                    ("Place of Birth", hero.biography.placeOfBirth ?? "Unknown"),
                                    ("First Appearance", hero.biography.firstAppearance ?? "Unknown")
                                ])

                                InfoCardView(title: "Appearance", items: [
                                    ("Gender", hero.appearance.gender ?? "Unknown"),
                                    ("Race", hero.appearance.race ?? "Unknown"),
                                    ("Height", hero.appearance.height?.last ?? "Unknown"),
                                    ("Weight", hero.appearance.weight?.last ?? "Unknown"),
                                    ("Eye Color", hero.appearance.eyeColor ?? "Unknown"),
                                    ("Hair Color", hero.appearance.hairColor ?? "Unknown")
                                ])

                                InfoCardView(title: "Extra", items: [
                                    ("Occupation", hero.work.occupation ?? "Unknown"),
                                    ("Base", hero.work.base ?? "Unknown"),
                                    ("Group", hero.connections.groupAffiliation ?? "Unknown"),
                                    ("Relatives", hero.connections.relatives ?? "Unknown")
                                ])
                            }
                            .padding()
                        }
                    } else {
                        Spacer()
                        Text("Tap the button to load a hero")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }

                    Button {
                        Task {
                            await viewModel.fetchRandomHero()
                        }
                    } label: {
                        Label("Randomize", systemImage: "sparkles")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 131/255, green: 55/255, blue: 127/255))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(radius: 8)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }
            }
            .navigationTitle("Hero Randomizer")
            .task {
                await viewModel.fetchRandomHero()
            }
        }
    }
}

#Preview {
    ContentView()
}
