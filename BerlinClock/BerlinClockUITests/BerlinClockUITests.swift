//
//  BerlinClockUITests.swift
//  BerlinClockUITests
//
//  Created by Me on 05/02/2026.
//

import XCTest

final class BerlinClockUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func test_clockUI_rendersCorrectNumberOfLampRows() throws {
        let expectedLampCounts = [
            (0, 1),  // Seconds row
            (1, 4),  // 5 hours
            (2, 4),  // 1 hour
            (3, 11), // 5 minutes
            (4, 4)   // 1 minute
        ]

        for (rowIndex, lampCount) in expectedLampCounts {
            let row = app.otherElements.matching(identifier: "lampRow_\(rowIndex)")
            XCTAssertEqual(row.count, lampCount, "Lamp row \(rowIndex) should have \(lampCount) lamps")
        }
    }

}
