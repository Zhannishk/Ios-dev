//
//  Superhero.swift
//  Supersuperhero
//
//  Created by Zhaniya Utemuratova on 13.12.2025.
//

import Foundation

struct Superhero: Codable {
    let id: Int
    let name: String
    let biography: Biography
    let powerstats: PowerStats
    let appearance: Appearance
    let images: Images
}

struct Biography: Codable {
    let fullName: String
    let placeOfBirth: String
    let alignment: String
}

struct PowerStats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let power: Int?
    let durability: Int?
    let combat: Int?
}

struct Appearance: Codable {
    let gender: String
    let race: String?
}

struct Images: Codable {
    let lg: String
}
