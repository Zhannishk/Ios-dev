//
//  MovieTableViewCell.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 10.12.2025.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(movie: MovieItem) {
        label.text = movie.title
        iconImageView.image = movie.image
    }
}
