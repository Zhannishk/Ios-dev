//
//  MusicViewController.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 06.12.2025.
//

import UIKit

struct MusicItem {
    let title: String
    let image: UIImage
}

class MusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let music: [MusicItem] = [
        MusicItem(title: "Anlasana", image: ._1),
        MusicItem(title: "The Last Waltz", image: ._2),
        MusicItem(title: "Criminal", image: ._3),
        MusicItem(title: "Medieval", image: ._4),
        MusicItem(title: "The Less I Know The Better", image: ._5),
        MusicItem(title: "Moonstruck", image: ._6),
        MusicItem(title: "Gabriella", image: ._7),
        MusicItem(title: "Miniskirt", image: ._8),
        MusicItem(title: "Бір сұрақ", image: ._9)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = music[indexPath.row]
        let musicCell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicTableViewCell
        musicCell.label.text = music.title
        musicCell.iconImageView.image = music.image
        return musicCell
    }
    
    
}
    
extension MusicViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) | \(indexPath.row)")
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


