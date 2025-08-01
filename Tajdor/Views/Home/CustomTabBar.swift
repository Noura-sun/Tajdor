//
//  CustomTabBar.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @State private var selectedTab = "الرئيسية"

    var body: some View {
        VStack(spacing: 0) {
            // 👇 محتوى التبويب بناءً على الاختيار
            Group {
                switch selectedTab {
                case "الرئيسية":
                    HomeView()
                case "الخريطة":
                    MapView()
//                case "التنبيهات":
//                    AlertsView()
//                case "الإعدادات":
//                    SettingsView()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // ✅ التاب بار نفسه
            HStack {
                Spacer()
                tabItem(icon: "house.fill", label: "الرئيسية")
                Spacer()
                tabItem(icon: "map", label: "الخريطة")
                Spacer()
                tabItem(icon: "bell", label: "التنبيهات")
                Spacer()
                tabItem(icon: "gearshape", label: "الإعدادات")
                Spacer()
            }
            .padding(.top, 10)
            .padding(.bottom, 25)
            .background(Color.white.shadow(radius: 2))
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    @ViewBuilder
    func tabItem(icon: String, label: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(selectedTab == label ? Color(hex: "0F1A0F") : .purple)
            Text(label)
                .font(.caption)
                .foregroundColor(selectedTab == label ? Color(hex: "0F1A0F") : .purple)
        }
        .onTapGesture {
            selectedTab = label
        }
    }
}
