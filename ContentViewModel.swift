//
//  ContentViewModel.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import Foundation
import MapKit

//final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    @Published var mapRegion: MKCoordinateRegion
//    var locationManager: CLLocationManager?
//
//    override init() {
//        // Set an initial location
//        self.mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.457105, longitude: -80.508361),
//                                            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//        super.init()
//        self.locationManager = CLLocationManager()
//        self.locationManager?.delegate = self
//        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//    func checkIfLocationIsEnabled() {
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager?.requestWhenInUseAuthorization()
//        } else {
//            print("Show an alert letting them know this is off")
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkLocationAuthorization()
//    }
//
//    private func checkLocationAuthorization() {
//        guard let locationManager = locationManager else { return }
//
//        switch locationManager.authorizationStatus {
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted, .denied:
//            print("Location permission denied.")
//        case .authorizedAlways, .authorizedWhenInUse:
//            locationManager.startUpdatingLocation()
//        default:
//            break
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            let newRegion = MKCoordinateRegion(center: location.coordinate,
//                                               span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//            DispatchQueue.main.async {
//                self.mapRegion = newRegion
//            }
//        }
//    }
//}
