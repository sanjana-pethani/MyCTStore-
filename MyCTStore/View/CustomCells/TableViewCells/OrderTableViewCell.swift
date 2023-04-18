//
//  OrderTableViewCell.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 10/04/23.
//

import UIKit
import SDWebImage

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var OrderStatusCollectionView: UICollectionView!
    
    var arrOrder: [StoreDataViewModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        OrderStatusCollectionView.register(UINib(nibName: "OrderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrderCollectionViewCell")
    }
    
    func set(arrOrder: [StoreDataViewModel]) {
        self.arrOrder = arrOrder
        OrderStatusCollectionView.delegate = self
        OrderStatusCollectionView.dataSource = self
        OrderStatusCollectionView.reloadData()
    }
}

// MARK: - BannerTableViewCell DelegateFlowLayout
extension OrderTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 397, height: 147)
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

extension OrderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOrder.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OrderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCollectionViewCell", for: indexPath) as! OrderCollectionViewCell
        let order: StoreDataViewModel = arrOrder[indexPath.row]
        cell.idLabel.text = order.getOrderId()
        cell.idLabel.textColor = .blue
        cell.amountLabel.text = order.getTotalPrice()
        cell.dateAndTimeLabel.text = order.getDateTime()
        cell.image.sd_setImage(with: URL(string: order.getImage()), placeholderImage: UIImage(systemName: "fireplace"))
        cell.statusLabel.text = order.getStatus()
        cell.storeNameLabel.text = order.getName()
        cell.setColor(view: cell.statusLabel)
        cell.storeNameLabel.text = order.getName()
        return cell
    }
}
