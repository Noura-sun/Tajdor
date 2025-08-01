//
//  HomeView.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = TankViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack(spacing: 10) {
                    // العنوان
                    HStack {
                        Text("الخزانات")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // خانة البحث
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .padding(.leading, 8)
                        
                        RightAlignedTextField(text: $searchText, placeholder: "البحث")
                            .frame(height: 22)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                    .padding(.horizontal)
                    .padding(.bottom, 6)
                    
                    
                    // قائمة الخزانات
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(viewModel.tanks.filter {
                                searchText.isEmpty || $0.name.contains(searchText) || $0.location.contains(searchText)
                            }) { tank in
                                TankCardView(tank: tank)
                            }
                        }
                    }
                    
                }
                
            }
        }
    }
}
