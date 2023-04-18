//
//  VendorTableViewCell.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 29/03/23.
//

import UIKit
import SDWebImage

class VendorTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var storeCountLabel: UILabel!
    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var vendorsCollectionView: UICollectionView!
    
    // MARK: - Variables
    var arrVendor: [VendorViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        vendorsCollectionView.register(UINib(nibName: "VendorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VendorCollectionViewCell")
    }

    func set(arrVendor: [VendorViewModel]) {
        self.arrVendor = arrVendor
        vendorsCollectionView.delegate = self
        vendorsCollectionView.dataSource = self
        vendorsCollectionView.reloadData()
    }
    
    @IBAction func viewMoreButtonTapped(_ sender: UIButton) {
        
    }
    
}

// MARK: - VendorTableViewCell Delegate & DataSource Method
extension VendorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return arrVendor.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VendorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorCollectionViewCell", for: indexPath) as! VendorCollectionViewCell
        let vendors: VendorViewModel = arrVendor[indexPath.row]
        cell.storeImageView.sd_setImage(with: URL(string: vendors.getImageName()), placeholderImage: UIImage(systemName: "fireplace"))
        cell.storeNameLabel.text = vendors.getName()
        cell.openAndCloseLabel.text = String(vendors.isOpen())
        cell.rupeesAndDeliveryLabel.text = "\(vendors.getMinimumOrder()) | \(vendors.getDeliveryChargers())"
        cell.ratingView.text = String(vendors.getRating())
        return cell
    }
}

// MARK: - VendorTableViewCell DelegateFlowLayout
extension VendorTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 81)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
