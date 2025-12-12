//
//  HeroModel.swift
//  Superhero
//
//  Created by Zhaniya Utemuratova on 12.12.2025.
//

import Foundation

struct HeroModel: Codable {
    let id: Int
    let name: String
    let powerstats: PowerStats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

struct PowerStats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let power: Int?
}

struct Appearance: Codable {
    let gender: String?
    let race: String?
}

struct Biography: Codable {
    let fullName: String?
}

struct Work: Codable {
    let occupation: String?
}

struct Connections: Codable {
    let groupAffiliation: String?
}

struct Images: Codable {
    let lg: String?
}
