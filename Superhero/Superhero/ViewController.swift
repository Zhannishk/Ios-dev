//
//  ViewController.swift
//  Superhero
//
//  Created by Zhaniya Utemuratova on 12.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroImageView: UIImageView!

        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var fullNameLabel: UILabel!
        @IBOutlet weak var intelligenceLabel: UILabel!
        @IBOutlet weak var strengthLabel: UILabel!
        @IBOutlet weak var speedLabel: UILabel!
        @IBOutlet weak var powerLabel: UILabel!
        @IBOutlet weak var genderLabel: UILabel!
        @IBOutlet weak var raceLabel: UILabel!
        @IBOutlet weak var occupationLabel: UILabel!
        @IBOutlet weak var groupLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHero()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomTapped(_ sender: UIButton) {
            fetchHero()
        }
    
    func fetchHero() {
        Task {
            do {
                let hero = try await service.fetchRandomHero()
                updateUI(with: hero)
            } catch {
                print("Error fetching hero:", error)
            }
        }
    }

    func updateUI(with hero: HeroModel) {
        if let urlString = hero.images.lg,
           let url = URL(string: urlString) {

            loadImage(from: url) { [weak self] in
                guard let self = self else { return }

                self.nameLabel.text = "Name: \(hero.name)"
                self.fullNameLabel.text = "Full Name: \(hero.biography.fullName ?? "-")"
                self.intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence ?? 0)"
                self.strengthLabel.text = "Strength: \(hero.powerstats.strength ?? 0)"
                self.speedLabel.text = "Speed: \(hero.powerstats.speed ?? 0)"
                self.powerLabel.text = "Power: \(hero.powerstats.power ?? 0)"
                self.genderLabel.text = "Gender: \(hero.appearance.gender ?? "-")"
                self.raceLabel.text = "Race: \(hero.appearance.race ?? "-")"
                self.occupationLabel.text = "Occupation: \(hero.work.occupation ?? "-")"
                self.groupLabel.text = "Group: \(hero.connections.groupAffiliation ?? "-")"
            }
            UIView.transition(with: view,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil)

        }
    }


    func loadImage(from url: URL, completion: (() -> Void)? = nil) {
        heroImageView.alpha = 0

        Task {
            if let (data, _) = try? await URLSession.shared.data(from: url),
               let image = UIImage(data: data) {
                heroImageView.image = image

                UIView.animate(withDuration: 0.5) {
                    self.heroImageView.alpha = 1
                }

                completion?()
            }
        }
    }
    let service = HeroService()
}
