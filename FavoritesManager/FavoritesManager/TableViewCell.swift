//
//  TableViewCell.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 06.12.2025.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(movie: MovieItem) {
        titleLabel.text = movie.title
        iconImageView.image = movie.image
    }
}
