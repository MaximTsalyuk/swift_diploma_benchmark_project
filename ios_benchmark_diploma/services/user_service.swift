//
//  user_service.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 04.12.2023.
//

import Foundation
import Combine
import SwiftyJSON

class UserService {
    let _baseUrl: String = "https://randomuser.me/api";
    
    func fetchData(usersAmount: Int) async -> [UserModel] {
        do {
            let url = URL(string: _baseUrl + "/?results=" + String(usersAmount))
            let (data, _) = try await URLSession.shared.data(from: url!)
            
            let json: JSON = try JSON(data: data)
            // If json is .Array
            // The `index` is 0..<json.count's string value
            var users: [UserModel] = []
            
            for (_,subJson):(String, JSON) in json["results"] {
                // Do something you want
                
                users.append(UserModel.fromJson(json: subJson))
            }
            
            return users
        } catch {
            print("Error fetching data: \(error)")
            
            return []
        }
    }
}
