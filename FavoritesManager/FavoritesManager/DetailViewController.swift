//
//  DetailViewController.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 11.12.2025.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {
        performSegue(withIdentifier: "third", sender: nil)
    }

    @IBAction func dismissButtonDidTap(_ sender: UIButton) {
//        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


