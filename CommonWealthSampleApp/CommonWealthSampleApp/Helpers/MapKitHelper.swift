//
//  MapKitHelper.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import Foundation
import MapKit

struct AnnotationItem:Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}
