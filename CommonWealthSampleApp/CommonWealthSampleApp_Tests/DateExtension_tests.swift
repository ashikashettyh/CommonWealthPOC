//
//  DateExtension_tests.swift
//  CommonWealthSampleApp_Tests
//
//  Created by Ashika Shetty on 29/02/24.
//

import XCTest
@testable import CommonWealthSampleApp
final class DateExtension_tests: XCTestCase {
    
    func test_DateExtension_formattedDate() throws {
        var dateComponents = DateComponents()
        dateComponents.year = 2022
        dateComponents.month = 2
        dateComponents.day = 21

        let calendar = Calendar.current

        if let date = calendar.date(from: dateComponents) {
            XCTAssertEqual(date.formattedDate(), "21 Feb 2022")
        }
    }
    
    func test_DateExtension_numberOfDaysAgo_singular() throws {
        // Get the current date
        let currentDate = Date()

        // Get the calendar and date components
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = -1

        if let date = calendar.date(byAdding: dateComponents, to: currentDate) {
            XCTAssertEqual(date.numberOfDaysAgo(), "1 Day Ago")
        }
    }
    
    func test_DateExtension_numberOfDaysAgo_plural() throws {
        let currentDate = Date()

        // Get the calendar and date components
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = -5

        if let date = calendar.date(byAdding: dateComponents, to: currentDate) {
            XCTAssertEqual(date.numberOfDaysAgo(), "5 Days Ago")
        }
    }

}
