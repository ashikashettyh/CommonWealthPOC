//
//  ATM.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import Foundation

struct ATM: Identifiable, Codable {
    let id: String
    let name: String
    let address: String
    let location: Location
}


struct Location: Codable {
    let lat: Double
    let lng: Double
}


