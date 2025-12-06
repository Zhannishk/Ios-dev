//
//  MusicTableViewCell.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 06.12.2025.
//

import UIKit

class MusicTableViewCell: UITableViewCell{
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(music: MusicItem) {
        label.text = music.title
        iconImageView.image = music.image
    }
    
}
