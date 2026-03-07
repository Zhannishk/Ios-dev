//
//  HeroService.swift
//  iOS_Adv_lab3
//
//  Created by Zhaniya Utemuratova on 07.03.2026.
//

import Foundation

enum HeroServiceError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingFailed

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Server returned an invalid response."
        case .decodingFailed:
            return "Failed to decode hero data."
        }
    }
}

final class HeroService {
    func fetchHero(id: Int) async throws -> Hero {
        guard let url = URL(string: "https://akabab.github.io/superhero-api/api/id/\(id).json") else {
            throw HeroServiceError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw HeroServiceError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(Hero.self, from: data)
        } catch {
            throw HeroServiceError.decodingFailed
        }
    }
}
