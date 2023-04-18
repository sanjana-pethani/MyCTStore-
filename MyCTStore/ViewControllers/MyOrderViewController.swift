//
//  MyOrderViewController.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 10/04/23.
//

import UIKit

class MyOrderViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var orderTableView: UITableView!
    
    // MARK: - Variable
    var viewModel: OrderViewModel = OrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        fetchDetalis()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Register Nib
    private func setUp() {
        orderTableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
        
        orderTableView.separatorStyle = .none
          if #available(iOS 15.0, *) { orderTableView.sectionHeaderTopPadding = 0.0 }
    }
    
    // MARK: - Get Home Page Detalis
    private func fetchDetalis() {
        guard Config.isInternetAvailable() else {
            print("Display No internet avalible popup")
            return
        }
        
        viewModel.fetchDetalis { result in
            switch result {
            case .success:
                print("Reload TableView")
                self.orderTableView.reloadData()
            case .failure(let error):
                print("Show this \(error.localizedDescription) in alert view")
            }
        }
    }
}

extension MyOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as! OrderTableViewCell
        cell.set(arrOrder: viewModel.arrStoreDetalis)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 2000
    }
    
}
