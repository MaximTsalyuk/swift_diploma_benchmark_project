//
//  user_tile.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 05.12.2023.
//

import SwiftUI

struct user_tile: View {
    @Binding var userModel: UserModel
    
    @State private var isPushed = false
    
    var body: some View {
        
        NavigationLink(destination: user_view(user: $userModel), isActive: $isPushed) {
            VStack() {
                Spacer()
                
                AsyncImage(url: URL(string: userModel.picture.thumbnail))
                    .clipShape(Circle())
                    .padding(.top, 10)
                
                
                HStack() {
                    Spacer()
                }
                
                Text("Hi, my name is")
                    .foregroundColor(.gray)
                
                Text(userModel.firstName + "")
                    .padding(.bottom, 10)
                
                
                Spacer()
            }
            .background(Color.blue.opacity(0.08))
            .cornerRadius(15)
            .onChange(of: isPushed, perform: {(new) in
                let df = DateFormatter()
                
                let startPushAnimationDate = Date()
                df.dateFormat = "yyyy-MM-dd HH:mm:ss:ms"
                let startPushAnimationDateString = df.string(from: startPushAnimationDate)
                
                print("Start Push Animation Date String: " + startPushAnimationDateString)
            })
        }
        
    }
    
    
}
