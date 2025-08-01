//
//  TankViewModel.swift
//  TR
//
//  Created by Noura  on 30/07/2025.
//

import Foundation

import CoreLocation

class TankViewModel: ObservableObject {
    @Published var tanks: [Tank] = [
        Tank(name: "خزان 1", location: "جبل السودة", lastUpdated: "10 / 2 / 1447 – 11:00 ص", fillPercentage: 0.85, imageName: "tank", coordinate: CLLocationCoordinate2D(latitude: 18.25, longitude: 42.5)),
        Tank(name: "خزان 2", location: "جبل السودة", lastUpdated: "10 / 2 / 1447 – 11:00 ص", fillPercentage: 0.45, imageName: "tank", coordinate: CLLocationCoordinate2D(latitude: 18.26, longitude: 42.52)),
        Tank(name: "خزان 3", location: "جبل السودة", lastUpdated: "10 / 2 / 1447 – 11:00 ص", fillPercentage: 0.30, imageName: "tank", coordinate: CLLocationCoordinate2D(latitude: 18.27, longitude: 42.53)),
        Tank(name: "خزان 4", location: "جبل السودة", lastUpdated: "10 / 2 / 1447 – 11:00 ص", fillPercentage: 0.70, imageName: "tank", coordinate: CLLocationCoordinate2D(latitude: 18.28, longitude: 42.54))
    ]
}


