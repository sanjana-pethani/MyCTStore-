//
//  LocationTableViewCell.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 29/03/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var areaView: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var areaButton: UIButton!
    @IBOutlet weak var serachButton: UIButton!
    
    @IBOutlet weak var rightArrowImageView: UIImageView!
    @IBOutlet weak var arearightArrowImageView: UIImageView!
    
    @IBOutlet weak var searchView: UISearchBar!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        cityView.setCorner(radius: 6)
        areaView.setCorner(radius: 6)
        
        cityView.layer.borderColor = UIColor.red.cgColor
        
        cityView.setBoarder(width: 4, color: UIColor.white)
        areaView.setBoarder(width: 4, color: UIColor.white)
        
      
       // backgroundColor  = AppColors.primaryColor
        
        cityButton.setTitle("Surat", for: .normal)
        areaButton.setTitle("Adajan", for: .normal)
        
        searchView.tintColor = AppColors.primaryColor
        searchView.barTintColor = AppColors.primaryColor
        searchView.backgroundColor = AppColors.primaryColor
        
        searchView.isTranslucent = false
        
        let textFieldInsideSerachBar = searchView.value(forKey: "searchField") as? UITextField
        textFieldInsideSerachBar?.font = UIFont.systemFont(ofSize: 14)
        textFieldInsideSerachBar?.backgroundColor = .white
        textFieldInsideSerachBar?.attributedPlaceholder =
        NSAttributedString(string: PlaceHolder.serachStore,
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        
        textFieldInsideSerachBar?.setCorner(radius: 8)
    }
}
