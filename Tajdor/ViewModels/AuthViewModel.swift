//
//  AuthViewModel.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
@MainActor
class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var licenseNumber: String = ""
    @Published var phoneNumber: String = ""

    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?

    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "يرجى إدخال البريد وكلمة المرور"
            return
        }
        // محاكاة تسجيل الدخول
        if email == "test@email.com" && password == "1234" {
            isLoggedIn = true
        } else {
            errorMessage = "بيانات الدخول غير صحيحة"
        }
    }

    func signUp() {
        guard !fullName.isEmpty, !email.isEmpty, !password.isEmpty, !phoneNumber.isEmpty, !licenseNumber.isEmpty else {
            errorMessage = "يرجى تعبئة جميع الحقول"
            return
        }
        // محاكاة تسجيل مستخدم جديد
        isLoggedIn = true
    }
}
