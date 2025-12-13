//
//  NetworkManager.swift
//  Supersuperhero
//
//  Created by Zhaniya Utemuratova on 13.12.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    let url = "https://akabab.github.io/superhero-api/api/all.json"

    func fetchHeroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        AF.request(url).responseDecodable(of: [Superhero].self) { response in
            switch response.result {
            case .success(let heroes):
                completion(.success(heroes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
