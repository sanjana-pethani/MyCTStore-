//
//  Config.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 28/03/23.
//

import Foundation
import UIKit

struct Config {
    static let appName = "MyCT Store"
    static let databaseName = "myctstore.db"
    static let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let androidLink: String = "https://play.google.com/store/apps/details?id=com.pragma.myctstore"
    static let iOSLink: String = "itms-apps://itunes.apple.com/us/app/apple-store/id1552347410?mt=8"
    static let iOSSharingText: String = "simple & easly order your food"
    static let appDateFormat = "dd MMM yyyy"
    static let appTimeFormat = "hh:mm a"
    static let serverDataFormat: String = "yyyy-MM-dd"
    static let amountSign: String = "₹"
    
    static func isInternetAvailable() -> Bool {
        let reachbility = Reachability()!
        return reachbility.isReachable ? (reachbility.isReachableViaWiFi || reachbility.isReachableViaWWAN) : false
    }
    
    static let baseURL: String = "https://myct.store/Mobile_Services/user/v2/index.php/"
    static let baseURLForCategories = "https://myct.store/admin/uploads/food_type/"
   static let baseURLForImage = "https://myct.store/admin/uploads/"
}
