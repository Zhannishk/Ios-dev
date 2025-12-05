//
//  TableViewCell.swift
//  TableView
//
//  Created by Zhaniya Utemuratova on 22.11.2025.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(movie: MovieItem) {
        titleLabel.text = movie.title
        subtitleLabel.text = movie.subtitle
        reviewLabel.text = movie.review
        iconImageView.image = movie.image
    }
}
