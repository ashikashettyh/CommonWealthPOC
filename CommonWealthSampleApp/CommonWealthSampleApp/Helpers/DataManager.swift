//
//  DataManager.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import Foundation

// Since we fetch the data only once and not write anything to it. Using a static here
struct DataManager {
    static func fetchAccountDetails() -> DataSample? {
        do {
            // creating a path from the main bundle and getting data object from the path
            if let bundlePath = Bundle.main.path(forResource: "Sample", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                // Decoding the Product type from JSON data using JSONDecoder() class.
                let dataSample: DataSample = try JSONDecoder().decode(DataSample.self, from: jsonData)
                
                return dataSample
            }
        } catch {
            print("faced error readind data from the JSON file:", error.localizedDescription)
            
        }
        return nil
    }
    
}
