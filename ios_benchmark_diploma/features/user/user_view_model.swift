//
//  user_view_model.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 04.12.2023.
//

import Foundation

final class UserViewModel: ObservableObject {
    var isBusy: Bool = false
    
    func onReady() {
        let df = DateFormatter()
        
        let endPushAnimationDate = Date()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss:ms"
        let endPushAnimationDateString = df.string(from: endPushAnimationDate)
        
        print("End Push Animation Date: " + endPushAnimationDateString)
    }
}
