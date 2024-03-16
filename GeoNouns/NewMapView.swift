//
//  NewMapView.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let trumanBrewery = CLLocationCoordinate2D(latitude: 51.52100005334061, longitude: -0.07270977977340437)
    static let trumanBrewerynearby = CLLocationCoordinate2D(latitude: 51.5201662671804, longitude: -0.069688043583292)
}

struct NewMapView: View {
    @StateObject private var nounAnnotations = NounAnnotations()
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var selectedNoun: String?
    @State private var showSheet = false
    
    var body: some View {
        Map(position: $position) {
            ForEach(nounAnnotations.annotations) { annotation in
                Annotation("", coordinate: annotation.coordinate, anchor: .bottom) {
                    Image(annotation.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            selectedNoun = annotation.imageName
                            showSheet = true
                        }
                }
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        .sheet(isPresented: $showSheet) {
            if let nounName = selectedNoun {
                if let nounName = selectedNoun {
                    NounInfoView(nounName: nounName) {
                        showSheet = false
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                }
            }
        }
    }
}
    
    struct NewMapView_Previews: PreviewProvider {
        static var previews: some View {
            NewMapView()
        }
    }
