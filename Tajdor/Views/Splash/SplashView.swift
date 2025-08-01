//
//  SplashView.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            VStack {
                Image("logo") // Add logo image to Assets
                    .resizable()
                    .frame(width: 100, height: 100)
                Image("tagatherTextLogo") // كلمة "تجذّر" بتنسيق التصميم
                       .resizable()
                       .scaledToFit()
                       .frame(width: 150) // حسب الحجم المرغوب
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
