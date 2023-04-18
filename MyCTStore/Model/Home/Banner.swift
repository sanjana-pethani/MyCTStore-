//
//  Banner.swift
//  MyCTStore
//
//  Created by Rakshil Dudhat on 01/04/23.
//

import Foundation

struct Banner: Decodable {
    var id: Int
    var image: String
    
    enum CodingKeys: String, CodingKey{
        case id = "v_id"
        case image = "filename"
    }
}


struct BannerViewModel {
    private let banner: Banner
    
    init(banner: Banner) {
        self.banner = banner
    }
    
    func getId() -> Int{ banner.id }
    func getImage() -> String {
        return Config.baseURLForImage + (banner.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
