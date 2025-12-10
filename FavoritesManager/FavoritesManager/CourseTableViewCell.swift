//
//  CourseTableViewCell.swift
//  FavoritesManager
//
//  Created by Zhaniya Utemuratova on 11.12.2025.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(course: CourseItem) {
        label.text = course.title
        iconImageView.image = course.image
    }

}
