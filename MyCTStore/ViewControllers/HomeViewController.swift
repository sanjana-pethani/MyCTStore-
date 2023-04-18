//
//  HomeViewController.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    var viewModel: HomeViewModel = HomeViewModel()
    var tableViewCells: [String] = ["LocationTableViewCell", "CategorieTableViewCell", "BannerTableViewCell", "DeliveryOptionsTableViewCell", "VendorTableViewCell"]
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // fetchDetalis()
        fechAllDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Initalization
    private func setUp() {
        tableViewCells.forEach { cellName in
            tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
        
        tableView.separatorStyle = .none
        if #available(iOS 15.0, *) { tableView.sectionHeaderTopPadding = 0.0 }
    }
    
    // MARK: - Get Home Page Detalis
    private func fetchDetalis() {
        guard Config.isInternetAvailable() else {
            print("Display No internet avalible popup")
            return
        }
        
        //        viewModel.fetchDetalis { result in
        //            switch result {
        //            case .success:
        //                print("Reload TableView")
        //                self.tableView.reloadData()
        //            case .failure(let error):
        //                print("Show this \(error.localizedDescription) in alert view")
        //            }
    }
    
    private func fechAllDetails() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        dispatchGroup.enter()
        viewModel.fetchDetalis { result in
            switch result {
            case .success:
                print("Reload TableView")
                    // self.tableView.reloadData()
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert view")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main){
         print("call thay")
            self.tableView.reloadData()
        }
    }
}

// MARK: - HomeViewController Delegate & DataSource Method
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
            return cell
        case 1:
            let cell: CategorieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategorieTableViewCell") as! CategorieTableViewCell
            cell.delegate = self
            cell.set(arrCategories: viewModel.arrCategories, selectedCategoryIndex: viewModel.selectedCategoryIndex)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.delegate = self
            cell.set(arrBanners: viewModel.arrBanner)
            return cell
        case 3:
            let cell: DeliveryOptionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DeliveryOptionsTableViewCell") as! DeliveryOptionsTableViewCell
            cell.delegate = self
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VendorTableViewCell") as! VendorTableViewCell
            cell.set(arrVendor: viewModel.arrVendor)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 107
        case 1: return 56
        case 2: return 176
        case 3: return 44
        case 4: return 950
        default: return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 0
        case 1: return 8
        case 2: return 0
        case 3: return 16
        case 4: return 8
        default: return 16
        }
    }
}


// MARK: - Protocol & delegate methods
extension HomeViewController: CategorieTableViewCellDelegate {
    func didSelect(at index: Int) {
        viewModel.update(selectedCategoryIndex: index)
        tableView.reloadData()
        fetchDetalis()
    }
}

extension HomeViewController: BannerTableViewCellDelegate {
    func didSelectBanner(at index: Int) {
      print(index)
    }
}

extension HomeViewController: DeliveryOptionsTableViewCellDelegate {
    func deliveryOptionSegmentTapped(selectedIndex: Int) {
        viewModel.update(selectedDeliveryIndex: selectedIndex)
        tableView.reloadData()
        fetchDetalis()
    }
}
