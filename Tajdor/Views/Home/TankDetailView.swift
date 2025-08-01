//
//  TankDetailView.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import SwiftUI

struct TankDetailView: View {
    let tank: Tank

    var body: some View {
        VStack(alignment: .trailing, spacing: 9) {
            Text("تفاصيل الخزان")
                .font(.title)
                .fontWeight(.bold)
                .offset(x: -100)

            VStack(alignment: .trailing, spacing: 4) {
                Text("مستوى الخزان")
                    .font(.headline)
                    .offset(x: -250) // تحريك لليمين

                Text("نسبة المياه")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .offset(x: -250) // تحريك لليمين

                Text(String(format: "٪%.0f", tank.fillPercentage * 100))
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .offset(x: -250) // تحريك لليمين

                Text("آخر ٧ أيام")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .offset(x: -250) // تحريك لليمين

            }
            .frame(maxWidth: .infinity, alignment: .trailing)

            Image("stats") // اسم صورة الإحصائيات
                .resizable()
                .scaledToFit()
                .frame(height: 220)

            VStack(alignment: .trailing, spacing: 8) {
                Text("دورات الري")
                    .font(.headline)
                    .offset(x: -250) // تحريك لليمين

                Text("بناءً على استهلاكك للمياه الأخير، تقدر تبقّي ٣ دورات ري قبل الحاجة لإعادة التعبئة.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }

            VStack(alignment: .trailing, spacing: 8) {
                Text("التحديثات الميدانية")
                    .font(.headline)
                    .offset(x: -200) // تحريك لليمين

                HStack {
                    Button(action: {
                        // إجراء رفع صورة
                    }) {
                        HStack {
                            Text("رفع صورة")
                            Image(systemName: "camera")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }
                .offset(x: -220) // تحريك لليمين
            }

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
