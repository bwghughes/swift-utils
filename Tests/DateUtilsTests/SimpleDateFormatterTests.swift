//
//  SimpleDateFormatterTests.swift
//  
//
//  Created by Witt, Robert on 22.03.20.
//

import XCTest
@testable import DateUtils

class SimpleDateFormatterTests: XCTestCase {
    
    static var allTests = [
        ("testFormatDate", testFormatDate),
        ("testFormatRelativeDate", testFormatRelativeDate),
    ]
    private let formatter = SimpleDateFormatter(locale: Locale(identifier: "en-GB"))
    
    func testFormatDate() {
        let date = Date(timeIntervalSince1970: 1576671427)
        
        var dateString = formatter.format(date: date, dateStyle: .medium, timeStyle: .none)
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, "18 Dec 2019")
        
        dateString = formatter.format(date: date, dateStyle: .long, timeStyle: .medium)
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, "18 December 2019 at 12:17:07")
        
        dateString = formatter.format(date: date, dateStyle: .short, timeStyle: .short)
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, "18/12/2019, 12:17")
    }
    
    func testFormatRelativeDate() {
        var dateString = formatter.format(relativeDate: Date())
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, "Today")
        
        dateString = formatter.format(relativeDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, "Yesterday")
        
        dateString = formatter.format(relativeDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, "Tomorrow")
    }
    
}
