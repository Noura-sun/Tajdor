//
//  SignupView.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import SwiftUI

struct SignupView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)

            Text("أنشئ حسابك")
                .font(.title2)
                .fontWeight(.bold)

            Text("سجّل الدخول للاستمتاع بأفضل تجربة إدارة")
                .font(.subheadline)
                .foregroundColor(.gray)

            // الحقول
            CustomInputField(icon: "person", placeholder: "الاسم الكامل", text: $viewModel.fullName)
            CustomInputField(icon: "envelope", placeholder: "البريد الإلكتروني", text: $viewModel.email)
            CustomInputField(icon: "lock", placeholder: "كلمة المرور", text: $viewModel.password, isSecure: true)
            CustomInputField(icon: "phone", placeholder: "رقم الجوال", text: $viewModel.phoneNumber)
            CustomInputField(icon: "creditcard", placeholder: "رقم الترخيص", text: $viewModel.licenseNumber)

            // في حال وجود خطأ
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }

            Button("إنشاء حساب") {
                viewModel.signUp()
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color(hex: "575757").opacity(0.7))
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(Color(hex: "7C00CA"), lineWidth: 1)
            )
            .padding(.horizontal)

            // جملة في المنتصف
            HStack(spacing: 2) {
                Spacer()
                Text("هل لديك حساب بالفعل؟")
                    .foregroundColor(.black)
                Button("تسجيل الدخول") {
                    dismiss()
                }
                .foregroundColor(Color(hex: "7C00CA"))
                Spacer()
            }
            .font(.footnote)
            .padding(.horizontal)
        }
        .padding()
        .environment(\.layoutDirection, .rightToLeft) // ⬅️ يجعل كل العناصر RTL
    }
}
