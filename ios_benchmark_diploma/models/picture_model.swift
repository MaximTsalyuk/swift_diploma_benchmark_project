//
//  picture_model.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 04.12.2023.
//

import Foundation
import SwiftyJSON

struct PictureModel: Codable {
    let large: String
    let medium: String
    let thumbnail: String
    
    static func fromJson(json: JSON) -> PictureModel {
        return PictureModel(large: json["large"].stringValue, medium: json["medium"].stringValue, thumbnail: json["thumbnail"].stringValue)
    }
}
