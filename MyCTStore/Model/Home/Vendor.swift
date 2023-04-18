//
//  Vendor.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 01/04/23.
//

import Foundation

struct Vendor: Decodable {
    var id: String
    var name: String
    var image: String
    var businessName: String
    var address: String
    var deliveryTime: String
    var deliveryTimeParameter: String
    var minOrder: String
    var deliveryChargers: String
    var isOpen: String
    var extraCharge: String
    var favouriteVendor: String
    var favId: String
    var rating: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, address, rating
        case businessName = "business_name"
        case deliveryTime = "delivery_time"
        case deliveryTimeParameter = "delivery_time_in"
        case minOrder = "min_order"
        case deliveryChargers = "delivery_charges"
        case isOpen = "isopen"
        case extraCharge = "extra_charge"
        case favouriteVendor = "favouriteRestau"
        case favId = "favid"
    }
}

struct VendorViewModel {
    private let vendor: Vendor
    
    init(vendor: Vendor) {
        self.vendor = vendor
    }
    
    func getId() -> String { vendor.id }
    func getName() -> String { vendor.businessName }
    func getImageName() -> String {
        return Config.baseURLForImage + (vendor.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
    
    func isOpen() -> Bool { vendor.isOpen == "Open" }
    func getDeliveryChargers() -> String{
       //return String(format: "$%f", Float(vendor.deliveryChargers) ?? 0)
        return "Delivery Fees: $\(vendor.deliveryChargers)"
    }
    
    func getMinimumOrder() -> String {
        return "Min. order: $\(vendor.minOrder)"
    }
    
    func getRating() -> Float { Float(vendor.rating) ?? 0 }
    func isFav() -> Bool { vendor.favouriteVendor == "yes" }
}
