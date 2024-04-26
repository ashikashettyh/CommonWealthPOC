//
//  MapView.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    let location: Location
    @State var mapRegion: MKCoordinateRegion
    let coordinate: CLLocationCoordinate2D
    
    init(location: Location) {
        self.location = location
        
        self.coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lng)
                   
        self.mapRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        }

    var body: some View {
            Map(coordinateRegion: $mapRegion, annotationItems: [AnnotationItem(coordinate: coordinate)]) {
                _ in
                MapAnnotation(coordinate: coordinate) {
                    Image("CBAFindUsAnnotationIconATM")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50.0, height: 50.0)
                        
            }
        }
        .navigationTitle("ATM Location")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MapView(location: Location(lat: -33.87, lng: 151.205))
}
