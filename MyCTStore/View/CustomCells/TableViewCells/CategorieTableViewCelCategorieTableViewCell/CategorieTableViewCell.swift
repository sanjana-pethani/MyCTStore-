//
//  CategorieTableViewCell.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 29/03/23.
//

import UIKit

protocol CategorieTableViewCellDelegate: AnyObject {
    func didSelect(at index: Int)
}

class CategorieTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // MARK: - Variable
    var arrCategorie: [StoreTypeViewModel] = []
    weak var delegate: CategorieTableViewCellDelegate?
    var selectedCategoryIndex: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    func set(arrCategories: [StoreTypeViewModel], selectedCategoryIndex: Int) {
        self.arrCategorie = arrCategories
        self.selectedCategoryIndex = selectedCategoryIndex
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.reloadData()
    }
    
    @IBAction func viewMoreButtonTapped(_ sender: UIButton) {
        
    }
}

// MARK: - CategorieTableViewCell DelegateFlowLayout
extension CategorieTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


// MARK: - CategorieTableViewCell Delegate & DataSource Method
extension CategorieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return arrCategorie.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let category: StoreTypeViewModel = arrCategorie[indexPath.row]
        if selectedCategoryIndex == indexPath.row {
            cell.backgroundColor = AppColors.primaryColor
            cell.nameLabel.textColor = .white
            cell.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        } else {
            cell.backgroundColor = .white
            cell.nameLabel.textColor = AppColors.primaryColor
            cell.nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        }
        cell.nameLabel.text = category.getType()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}
