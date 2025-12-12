//
//  HeroService.swift
//  Superhero
//
//  Created by Zhaniya Utemuratova on 12.12.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class HeroService {
    func fetchRandomHero() async throws -> HeroModel {
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        // Debug: print raw JSON
        if let jsonString = String(data: data, encoding: .utf8) {
            print("JSON:\n\(jsonString)")
        }

        do {
            return try JSONDecoder().decode(HeroModel.self, from: data)
        } catch {
            print("Decoding error →", error)
            throw NetworkError.decodingError
        }
    }
}
