//
//  TankModel.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation
import CoreLocation

struct Tank: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let location: String
    let lastUpdated: String
    let fillPercentage: Double
    let imageName: String
    let coordinate: CLLocationCoordinate2D

    static func == (lhs: Tank, rhs: Tank) -> Bool {
        lhs.id == rhs.id
    }
}
