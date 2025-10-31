//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Zhaniya Utemuratova on 31.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.isHidden = true
        image.isHidden = true
    }
    let itemTitles = [
        "Apple — High in fiber and vitamin C; supports heart health and good digestion.",
        "Banana — Full of potassium and vitamin B6; boosts energy and regulates mood.",
        "Orange — Packed with vitamin C; strengthens immunity and supports healthy skin.",
        "Grapes — Contain resveratrol and antioxidants; promote heart and brain health.",
        "Kiwi — Loaded with vitamin C and fiber; supports immunity and digestion.",
        "Mango — High in vitamin A and enzymes; good for eyes, skin, and digestion.",
        "Strawberry — Rich in vitamin C and antioxidants; supports heart health and glowing skin.",
        "Watermelon — Very hydrating and full of lycopene; supports heart and muscle recovery.",
        "Pineapple — Contains bromelain and vitamin C; aids digestion and boosts immunity.",
        "Cherry — Rich in antioxidants and vitamin C; helps improve sleep and reduces inflammation."
    ]

    @IBAction func radomizeButtonAction(_ sender: Any) {
        let randomNumber = Int.random(in: 1...10)
        image.image = UIImage(named: "fruit\(randomNumber)")
        label.text = itemTitles[randomNumber-1]
        
        label.isHidden = false
        image.isHidden = false
        
        UIView.transition(with: image, duration: 1.0, options: .transitionCrossDissolve, animations: nil,  completion: nil)
        UIView.transition(with: label, duration: 0.5, options: .transitionCrossDissolve, animations: nil,  completion: nil)
        
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if (motion == .motionShake){
                radomizeButtonAction((Any).self)
            }
        }
    
    

}

