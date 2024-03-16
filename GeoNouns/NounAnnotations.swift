//
//  NounAnnotations.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import CoreLocation

class NounAnnotations: ObservableObject {
    @Published var annotations: [MapAnnotationItem] = []
    
    init() {
        generateRandomAnnotations(count: 20, withinMiles: 3)
    }
    
    private func generateRandomAnnotations(count: Int, withinMiles: Double) {
        let center = CLLocationCoordinate2D.trumanBrewery
        let radiusInDegrees = radiusInDegrees(forMiles: withinMiles)
        var usedImageNames = Set<String>()
        
        for _ in 0..<count {
            let randomLat = center.latitude + (Double.random(in: -radiusInDegrees...radiusInDegrees))
            let randomLon = center.longitude + (Double.random(in: -radiusInDegrees...radiusInDegrees))
            let randomCoordinate = CLLocationCoordinate2D(latitude: randomLat, longitude: randomLon)
            
            var imageName: String
            repeat {
                imageName = "noun_\(Int.random(in: 1...100))"
            } while usedImageNames.contains(imageName)
            
            usedImageNames.insert(imageName)
            let annotation = MapAnnotationItem(coordinate: randomCoordinate, imageName: imageName)
            annotations.append(annotation)
        }
    }
}

func radiusInDegrees(forMiles miles: Double) -> Double {
    /// Earth's radius in miles
    let earthRadiusInMiles = 3958.8

    let radiusInDegrees = (miles / earthRadiusInMiles) * (180 / .pi)

    return radiusInDegrees
}

struct MapAnnotationItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var imageName: String
}
