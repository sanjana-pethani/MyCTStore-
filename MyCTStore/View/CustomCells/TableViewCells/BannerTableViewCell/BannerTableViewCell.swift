//
//  BannerTableViewCell.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 29/03/23.
//

import UIKit
import SDWebImage

protocol BannerTableViewCellDelegate: AnyObject {
    func didSelectBanner(at index: Int)
}

class BannerTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    // MARK: - Variable
    var arrBanner: [BannerViewModel] = []
    weak var delegate: BannerTableViewCellDelegate?
    
    // MARK: - Life cycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
    }
    
    func set(arrBanners: [BannerViewModel]) {
        self.arrBanner = arrBanners
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.reloadData()
    }
}

// MARK: - BannerTableViewCell DelegateFlowLayout
extension BannerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 176)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

// MARK: - BannerTableViewCell Delegate & DataSource Method
extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        let banner: BannerViewModel = arrBanner[indexPath.row]
        cell.imgView.sd_setImage(with: URL(string: banner.getImage()), placeholderImage: UIImage(systemName: "fireplace"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectBanner(at: indexPath.row)
    }
}
