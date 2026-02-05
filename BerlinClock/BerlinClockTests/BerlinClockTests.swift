//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by Me on 05/02/2026.
//

import XCTest
@testable import BerlinClock

final class BerlinClockTests: XCTestCase {

    private var clock: BerlinClockConverter!

    override func setUp() {
        super.setUp()
        clock = BerlinClockConverter()
    }

    override func tearDown() {
        clock = nil
        super.tearDown()
    }
    
    // MARK: - Seconds Lamp Tests
    /// The seconds lamp should be ON ("Y") when the seconds are even
    func test_secondLamp_shouldBeOn_whenSecondsAreEven() {
            let result = clock.convert(time: "00:00:00")
            XCTAssertEqual(result[0], "Y")
    }

    /// The seconds lamp should be OFF ("O") when the seconds are odd
    func test_secondLamp_shouldBeOff_whenSecondsAreOdd() {
            let result = clock.convert(time: "00:00:01")
            XCTAssertEqual(result[0], "O")
    }

    
    // MARK: - 5-Hour Row Tests
    /// Tests for the top row of hours, where each lamp represents 5 hours
    
    /// At midnight (00:00:00), the 5-hour row should have no red lamps
    func test_fiveHourRow_shouldHaveNoRedLamps_atMidnight() {
         let result = clock.convert(time: "00:00:00")
         XCTAssertEqual(result[1], "OOOO")
     }

     /// At 10:00:00, the 5-hour row should have two red lamps
     func test_fiveHourRow_shouldHaveTwoRedLamps_atTenHours() {
         let result = clock.convert(time: "10:00:00")
         XCTAssertEqual(result[1], "RROO")
     }

     /// At 20:00:00, the 5-hour row should have four red lamps
     func test_fiveHourRow_shouldHaveFourRedLamps_atTwentyHours() {
         let result = clock.convert(time: "20:00:00")
         XCTAssertEqual(result[1], "RRRR")
     }
    
    
    // MARK: - 1-Hour Row Tests
    /// Tests for the bottom row of hours, where each lamp represents 1 hour
    
    /// At exactly 5 hours (05:00:00), the 1-hour row should have no red lamps
    func test_oneHourRow_shouldHaveNoRedLamps_atExactFiveHours() {
        let result = clock.convert(time: "05:00:00")
        XCTAssertEqual(result[2], "OOOO")
    }

    /// At 8:00:00, the 1-hour row should have three red lamps
    func test_oneHourRow_shouldHaveThreeRedLamps_atEightHours() {
        let result = clock.convert(time: "08:00:00")
        XCTAssertEqual(result[2], "RRRO")
    }

    /// At 14:00:00, the 1-hour row should have four red lamps
    func test_oneHourRow_shouldHaveFourRedLamps_atFourteenHours() {
        let result = clock.convert(time: "14:00:00")
        XCTAssertEqual(result[2], "RRRR")
    }
    
}


