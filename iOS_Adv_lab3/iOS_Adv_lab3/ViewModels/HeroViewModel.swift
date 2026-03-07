//
//  HeroViewModel.swift
//  iOS_Adv_lab3
//
//  Created by Zhaniya Utemuratova on 07.03.2026.
//

import Foundation
import SwiftUI

@MainActor
final class HeroViewModel: ObservableObject {
    @Published var hero: Hero?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = HeroService()

    func fetchRandomHero() async {
        isLoading = true
        errorMessage = nil

        do {
            let randomID = Int.random(in: 1...731)
            hero = try await service.fetchHero(id: randomID)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
