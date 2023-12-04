//
//  user_model.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 04.12.2023.
//

import Foundation
import SwiftyJSON

struct UserModel: Codable, Identifiable {
    var id = UUID().uuidString
    
    var gender: String
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var age: Int
    var picture: PictureModel
    
    static func fromJson(json: JSON) -> UserModel {
        return UserModel(gender: json["gender"].stringValue, firstName: json["name"]["first"].stringValue, lastName: json["name"]["last"].stringValue, email: json["email"].stringValue, phone: json["phone"].stringValue, age: json["dob"]["age"].intValue, picture: PictureModel.fromJson(json: json["picture"]))
    }
}
