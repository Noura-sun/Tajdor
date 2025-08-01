//
//  LoginView.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    @State private var showSignup = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            Text("ابدأ بإعداد حسابك")
                .font(.title2)
                .fontWeight(.bold)

            Text("سجّل الدخول للاستمتاع بأفضل تجربة إدارة")
                .font(.subheadline)
                .foregroundColor(.gray)

            VStack(spacing: 16) {
                CustomInputField(icon: "envelope", placeholder: "البريد الإلكتروني", text: $viewModel.email)
                CustomInputField(icon: "lock", placeholder: "كلمة المرور", text: $viewModel.password, isSecure: true)
            }

            HStack {
                Button("هل نسيت كلمة المرور؟") {
                    // تنفيذ الإجراء
                }
                .foregroundColor(Color(hex: "7C00CA"))
                .font(.footnote)
                
                Spacer()
            }
            .padding(.horizontal)


            HStack {
                Toggle("تذكرني", isOn: .constant(false))
                    .font(.subheadline)
                    .toggleStyle(SwitchToggleStyle(tint: .purple))

                Spacer()
            }
            .padding(.horizontal)

            Button(action: {
                // تنفيذ الإجراء
            }) {
                Text("تسجيل الدخول")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .background(Color(hex: "575757").opacity(0.7))
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color(hex: "7C00CA"), lineWidth: 1)
                    )
                    .cornerRadius(28)
            }
            .padding(.horizontal)

            HStack(spacing: 2) {
                Spacer()
                
                Text("ليس لديك حساب؟")
                    .foregroundColor(.gray)
                
                Button("أنشئ حسابًا") {
                    showSignup = true
                }
                .foregroundColor(Color(hex: "7C00CA"))
                
                Spacer()
            }
            .font(.footnote)
            .padding(.horizontal)
            Spacer()

        }
        .padding()
        .environment(\.layoutDirection, .rightToLeft)
        .fullScreenCover(isPresented: $showSignup) {
            SignupView(viewModel: viewModel)
        }
    }
}
