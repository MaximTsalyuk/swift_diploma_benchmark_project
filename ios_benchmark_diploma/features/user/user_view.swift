//
//  user_view.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 04.12.2023.
//

import SwiftUI

struct user_view: View {
    @Binding var user: UserModel
    
    var body: some View {
        user_view_layout(user: $user)
    }
}

struct user_view_layout: View {
    @Binding var user: UserModel
   
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
            VStack() {
                
                AsyncImage(url: URL(string: user.picture.large))
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    
                    Text(
                        "First Name: " + user.firstName
                    )
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    .padding(.top, 50)
                    
                    Text(
                        "Last Name: " + user.lastName
                    )
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    
                    Text(
                        "Email: " + user.email
                    )
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    
                    Text(
                        "Phone: " + user.phone
                    )
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    
                    Text(
                        "Gender: " + user.gender
                    )
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    
                }
            }
            .frame(height: UIScreen.main.bounds.height - 200, alignment: .top)
            .onAppear {
                viewModel.onReady()
            }
        }
}
