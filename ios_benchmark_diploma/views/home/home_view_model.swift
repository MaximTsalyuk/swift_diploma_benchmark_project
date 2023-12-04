//
//  home_view_model.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 04.12.2023.
//

import Foundation
import SwiftUI

extension home_view {
    @MainActor class HomeViewModel: ObservableObject {
        @Published var isBusy: Bool = false
        @Published var users: [UserModel] = []
        
        let userService: UserService = UserService()
        
        func onReady() async {
            let df = DateFormatter()
            
            let startAPIFetchDate = Date()
            df.dateFormat = "yyyy-MM-dd HH:mm:ss:ms"
            let startAPIFetchDateString = df.string(from: startAPIFetchDate)
            
            print("Start API Fetch Date String: " + startAPIFetchDateString)
            
            isBusy = true
            
            users = await userService.fetchData(usersAmount: 1000)
            
            isBusy = false
            
            let endAPIFetchDate = Date()
            df.dateFormat = "yyyy-MM-dd HH:mm:ss:ms"
            let endAPIFetchDateString = df.string(from: endAPIFetchDate)
            
            print("End API Fetch Date String: " + endAPIFetchDateString)
        }
    }
}
