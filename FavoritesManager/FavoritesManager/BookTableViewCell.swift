//
//  BookTableViewCell.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 10.12.2025.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(book: BookItem) {
        label.text = book.title
        iconImageView.image = book.image
    }

}
