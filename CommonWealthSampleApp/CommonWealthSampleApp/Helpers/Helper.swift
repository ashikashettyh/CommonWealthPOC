//
//  ExtensionHelpers.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 29/02/24.
//

import Foundation
import SwiftUI
import UIKit

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
    
    func numberOfDaysAgo() -> String {
        let calendar = Calendar.current
        let currentDate = Date()
        let components = calendar.dateComponents([.day], from: self, to: currentDate)
        var daysAgoText = "Days Ago"
        if components.day == 1 {
            daysAgoText = "Day Ago"
        }
        return "\(components.day ?? 0) " + daysAgoText
    }
}


struct Constants {
    static let headerColor = Color(UIColor(displayP3Red: 244 / 255, green: 244 / 255, blue: 244 / 255, alpha: 1.0))
    
    static let accountBGColor = Color(UIColor(red: 152/255, green: 175/255, blue: 175/255, alpha: 1.0))
}
