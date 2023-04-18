//
//  AppEndPoints.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 31/03/23.
//

import Foundation

enum APIEndPoint {
    case getArea
    // case getArea(cityId: Int)
    case getCity
    case homepage
    case getOrder
    
    var url: String {
        switch self {
//        case .getArea:
//            return "\(Config.baseURL)/get_area/\(cityId)"
        case .getArea:
            return "\(Config.baseURL)/get_area"
        case .getCity:
            return "\(Config.baseURL)/get_city"
        case .homepage:
            return "\(Config.baseURL)/homepage"
        case .getOrder:
            return "\(Config.baseURL)/get_order/8"
        }
    }
}
