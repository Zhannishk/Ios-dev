//
//  UserDefaultsManager.swift
//  Supersuperhero
//
//  Created by Zhaniya Utemuratova on 13.12.2025.
//

import Foundation
class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private init() {}

    private let heroIDKey = "lastHeroID"

    func saveHeroID(_ id: Int) {
        UserDefaults.standard.set(id, forKey: heroIDKey)
    }

    func loadHeroID() -> Int? {
        return UserDefaults.standard.integer(forKey: heroIDKey)
    }
}
