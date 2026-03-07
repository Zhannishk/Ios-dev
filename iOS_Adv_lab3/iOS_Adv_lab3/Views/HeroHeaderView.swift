//
//  HeroHeaderView.swift
//  iOS_Adv_lab3
//
//  Created by Zhaniya Utemuratova on 07.03.2026.
//

import SwiftUI

struct HeroHeaderView: View {
    let hero: Hero

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: hero.images.lg ?? "")) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.gray.opacity(0.15))
                        ProgressView()
                    }
                    .frame(height: 320)

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 320)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 24))

                case .failure:
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.gray.opacity(0.15))
                        Image(systemName: "photo")
                            .font(.system(size: 40))
                            .foregroundStyle(.secondary)
                    }
                    .frame(height: 320)

                @unknown default:
                    EmptyView()
                }
            }

            VStack(spacing: 6) {
                Text(hero.name)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text(hero.biography.fullName ?? "Unknown identity")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
