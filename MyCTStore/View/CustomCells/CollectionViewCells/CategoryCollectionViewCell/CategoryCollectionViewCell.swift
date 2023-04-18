//
//  CategoryCollectionViewCell.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 29/03/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
            setCorner(radius: 4)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth  = 1
        layer.borderColor = UIColor.red.cgColor
    }

}
