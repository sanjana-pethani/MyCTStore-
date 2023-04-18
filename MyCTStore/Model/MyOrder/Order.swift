//
//  Order.swift
//  MyCTStore
//
//  Created by Rakshil Dudhat on 10/04/23.
//

import Foundation

struct OrderAPIResponse: Decodable {
    let error: Bool
    let arrStoredata: [StoreData]
    
    enum CodingKeys: String, CodingKey {
        case error
        case arrStoredata = "data"
    }
}
