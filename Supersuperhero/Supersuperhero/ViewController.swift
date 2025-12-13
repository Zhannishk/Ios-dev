//
//  ViewController.swift
//  Supersuperhero
//
//  Created by Zhaniya Utemuratova on 13.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var statsLabel: UILabel!

    var heroes: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroes()
    }

    func loadHeroes() {
        NetworkManager.shared.fetchHeroes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let heroes):
                    self.heroes = heroes
                    self.restoreLastHeroOrRandom()
                case .failure:
                    self.showError()
                }
            }
        }
    }

    func restoreLastHeroOrRandom() {
        if let savedID = UserDefaultsManager.shared.loadHeroID(),
           let hero = heroes.first(where: { $0.id == savedID }) {
            display(hero)
        } else {
            showRandomHero()
        }
    }

    @IBAction func randomizeTapped(_ sender: UIButton) {
        showRandomHero()
    }

    func showRandomHero() {
        guard let hero = heroes.randomElement() else { return }
        display(hero)
        UserDefaultsManager.shared.saveHeroID(hero.id)
    }

    func display(_ hero: Superhero) {
        nameLabel.text = hero.name
        fullNameLabel.text = hero.biography.fullName

        statsLabel.text = """
        Intelligence: \(hero.powerstats.intelligence ?? 0)
        Strength: \(hero.powerstats.strength ?? 0)
        Speed: \(hero.powerstats.speed ?? 0)
        Power: \(hero.powerstats.power ?? 0)
        Durability: \(hero.powerstats.durability ?? 0)
        Combat: \(hero.powerstats.combat ?? 0)
        Gender: \(hero.appearance.gender)
        Race: \(hero.appearance.race ?? "Unknown")
        Birthplace: \(hero.biography.placeOfBirth)
        Alignment: \(hero.biography.alignment)
        """

        heroImageView.kf.setImage(
            with: URL(string: hero.images.lg),
            placeholder: UIImage(systemName: "photo")
        )
    }

    func showError() {
        let alert = UIAlertController(
            title: "Error",
            message: "Failed to load superheroes",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

