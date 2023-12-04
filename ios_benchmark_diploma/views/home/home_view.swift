//
//  home_view.swift
//  ios_benchmark_diploma
//
//  Created by Maxim Tsalyuk on 04.12.2023.
//

import SwiftUI

struct home_view: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack() {
                
                if !viewModel.users.isEmpty {
                    home_view_layout(users: $viewModel.users)
                }
                
                if viewModel.isBusy {
                    ProgressView()
                        .frame(width: 1000, height: 1000)
                        .background(Color.black)
                        .opacity(0.8)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .controlSize(.large)
                }
            }.onAppear{
                Task {
                    if viewModel.users.isEmpty {
                        await viewModel.onReady()
                    }
                }
            }
        }
    }
}

struct home_view_layout: View {
    @Binding var users: [UserModel]
    
    let columns = [
        GridItem(),
        GridItem(),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach($users) { item in
                    user_tile(userModel: item)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight:  UIScreen.main.bounds.height)
    }
}

#Preview {
    home_view()
}
