//
//  Area.swift
//  MyCTStore
//
//  Created by Sanjana pethani on 31/03/23.
//

import Foundation

struct Area: Decodable{
    var areaName: String
    var stats: String
    
    enum CodingKeys: String, CodingKey {
        case stats
        case areaName = "area_name"
    }
}
