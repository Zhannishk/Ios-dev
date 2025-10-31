//
//  ViewController.swift
//  DiceeApp
//
//  Created by Zhaniya Utemuratova on 25.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftDiceImage: UIImageView!
    @IBOutlet weak var rightDiceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButtonAction(_ sender: Any) {
        let leftRoll = Int.random(in: 1...6)
        let rigthRoll = Int.random(in: 1...6)
        
        leftDiceImage.image = UIImage(named: "dice-\(leftRoll)")
        rightDiceImage.image = UIImage(named: "dice-\(rigthRoll)")
        
        //animation
        UIView.transition(with: leftDiceImage, duration: 0.5, options: .transitionFlipFromBottom, animations: nil,  completion: nil)
        UIView.transition(with: rightDiceImage, duration: 0.5, options: .transitionFlipFromTop, animations: nil,  completion: nil)
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (motion == .motionShake){
            rollButtonAction((Any).self)
        }
    }
    
}

