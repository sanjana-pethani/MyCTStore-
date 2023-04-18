//
//  OrderViewModel.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 10/04/23.
//

import Foundation
import Alamofire

final class OrderViewModel {
    // MARK: - Variable
    private let apiManager: APIManager = APIManager()
    private(set) var arrStoreDetalis: [StoreDataViewModel] = []
    
    // MARK: - Almofire Method
    func fetchDetalis(completion: @escaping(Result<(), Error>) -> Void) {
        apiManager.request(with: APIEndPoint.getOrder.url, methodType: .get) {
            response in
            switch response {
            case .success(let data):
                do {
                    let orderAPIResponse = try JSONDecoder().decode(OrderAPIResponse.self, from: data)
                    self.arrStoreDetalis = orderAPIResponse.arrStoredata.map { StoreDataViewModel(storeData: $0)}
                    print(self.arrStoreDetalis)
                    completion(.success(()))
                } catch {
                    completion(.failure(APIError.invaildResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension OrderViewModel {
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRow() -> Int { return 1 }
}

enum OrderPageTableSection {
    case order(arrOrder: [StoreDataViewModel])
}
