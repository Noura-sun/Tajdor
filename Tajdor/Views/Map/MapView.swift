//
//  MapView.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    @State private var selectedTank: Tank? = nil
    @State private var sheetExpanded = false
    @StateObject private var viewModel = TankViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // الخريطة
            Map(
                coordinateRegion: .constant(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 18.25, longitude: 42.5),
                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                )),
                annotationItems: viewModel.tanks
            ) { tank in
                MapAnnotation(coordinate: tank.coordinate) {
                    Button(action: {
                        withAnimation {
                            selectedTank = tank
                            sheetExpanded = false
                        }
                    }) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.purple)
                    }
                }
            }

            // الورقة السفلية
            if let tank = selectedTank {
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        
                        ScrollView {
                            VStack(spacing: 16) {
                                
                                // زر الإغلاق
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        withAnimation {
                                            selectedTank = nil
                                        }
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                            .font(.title2)
                                    }
                                }
                                
                                // شريط السحب في المنتصف
                                HStack {
                                    Spacer()
                                    Capsule()
                                        .fill(Color.secondary)
                                        .frame(width: 40, height: 6)
                                    Spacer()
                                }
                                .padding(.top, 4)
                                .onTapGesture {
                                    withAnimation {
                                        sheetExpanded.toggle()
                                    }
                                }

                                // معلومات الخزان (الصورة يمين - النص يسار)
                                HStack {
                                    Image(tank.imageName)
                                        .resizable()
                                        .frame(width: 80, height: 60)
                                        .cornerRadius(8)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text(tank.name)
                                            .font(.subheadline)
                                            .foregroundColor(.purple)
                                        
                                        Text("مستوى الماء: \(String(format: "%%%.0f", tank.fillPercentage * 100))")
                                            .bold()
                                        
                                        Text("اخر تحديث: \(tank.lastUpdated)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)

                                // المحتوى الموسع
                                if sheetExpanded {
                                    Divider()
                                    
                                    Text("آخر ٧ أيام")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .foregroundColor(.gray)
                                        .font(.footnote)

                                    Image("stats")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)

                                    Text("دورات الري")
                                        .font(.headline)
                                        .frame(maxWidth: .infinity, alignment: .trailing)

                                    Text("بناءً على استهلاكك للمياه الأخير، تقدر تبقي ٣ دورات ري قبل الحاجة لإعادة التعبئة.")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)

                                    VStack(alignment: .trailing, spacing: 8) {
                                        Text("التحديثات الميدانية")
                                            .font(.headline)
                                        HStack {
                                            Spacer()
                                            Text("رفع صورة")
                                                .foregroundColor(.blue)
                                            Image(systemName: "camera")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                        .frame(height: sheetExpanded ? geometry.size.height * 0.85 : 200)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(radius: 8)
                        )
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut, value: selectedTank)
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
