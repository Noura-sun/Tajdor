//
//  TankCardView.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import SwiftUI

struct TankCardView: View {
    let tank: Tank

    var body: some View {
        
        NavigationLink(destination: TankDetailView(tank: tank)) {
            
            HStack {
                // صورة الخزان
                Image(tank.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 80)
                    .cornerRadius(10)
                
                VStack(alignment: .trailing, spacing: 6) {
                    // العنوان (مثلاً: "خزان 1")
                    Text(tank.name)
                        .font(.caption)
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity)
                        .offset(x: -60) // تحريك لليمين
                    
                    // اسم الموقع
                    Text(tank.location)
                        .font(.title3)
                        .bold()
                        .offset(x: -99) // تحريك لليمين
                    
                    // آخر تحديث
                    Text("آخر تحديث: \(tank.lastUpdated)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    // النسبة والبار
                    HStack(spacing: 6) {
                        Text(String(format: "٪%.0f", tank.fillPercentage * 100))
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(fillColor)
                        
                        ProgressView(value: tank.fillPercentage)
                            .progressViewStyle(LinearProgressViewStyle(tint: fillColor))
                            .frame(height: 5)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.top, 4)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle()) // يمنع تغيير شكل الزر عند الضغط
    }

    var fillColor: Color {
        switch tank.fillPercentage {
        case 0..<0.4: return .red
        case 0.4..<0.7: return .orange
        default: return .green
        }
    }
}
