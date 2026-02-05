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
    
    // MARK: - 5-Minute Row Tests
    /// Tests for the top row of minutes, where each lamp represents 5 minutes
    
    /// At 00:00, the 5-minute row should have no lamps on
    func test_fiveMinuteRow_shouldHaveNoLampsOn_atZeroMinutes() {
        let result = clock.convert(time: "00:00:00")
        XCTAssertEqual(result[3], "OOOOOOOOOOO")
    }

    /// At 00:05, the 5-minute row should have the first yellow lamp on
    func test_fiveMinuteRow_shouldHaveYellowLamp_atFiveMinutes() {
        let result = clock.convert(time: "00:05:00")
        XCTAssertEqual(result[3], "YOOOOOOOOOO")
    }

    /// At 00:15, the 5-minute row should have a red lamp at the 15-minute position
    func test_fiveMinuteRow_shouldHaveRedLamp_atFifteenMinutes() {
        let result = clock.convert(time: "00:15:00")
        XCTAssertEqual(result[3], "YYROOOOOOOO")
    }

    /// At 00:45, the 5-minute row should alternate yellow and red lamps correctly
    func test_fiveMinuteRow_shouldAlternateYellowAndRedLamps() {
        let result = clock.convert(time: "00:45:00")
        XCTAssertEqual(result[3], "YYRYYRYYROO")
    }

    /// At 00:55, the 5-minute row should have all lamps on
    func test_fiveMinuteRow_shouldHaveAllLampsOn_atFiftyFiveMinutes() {
        let result = clock.convert(time: "00:55:00")
        XCTAssertEqual(result[3], "YYRYYRYYRYY")
    }

    // MARK: - 1-Minute Row Tests
    /// Tests for the bottom row of minutes, where each lamp represents 1 minute
    
    /// At exactly 5 minutes (00:05), the 1-minute row should have no lamps on
    func test_oneMinuteRow_shouldHaveNoLampsOn_atExactFiveMinutes() {
        let result = clock.convert(time: "00:05:00")
        XCTAssertEqual(result[4], "OOOO")
    }

    /// At 00:06, the 1-minute row should have the first lamp on
    func test_oneMinuteRow_shouldHaveOneLampOn_atSixMinutes() {
        let result = clock.convert(time: "00:06:00")
        XCTAssertEqual(result[4], "YOOO")
    }

    /// At 00:09, the 1-minute row should have four lamps on
    func test_oneMinuteRow_shouldHaveFourLampsOn_atNineMinutes() {
        let result = clock.convert(time: "00:09:00")
        XCTAssertEqual(result[4], "YYYY")
    }
    
    // MARK: - Full Berlin Clock (End-to-End) Tests
    /// Tests the full Berlin Clock representation for a given time
    
    /// At 13:17:01, the Berlin Clock should return the correct lamp states for all rows
    func test_fullBerlinClockRepresentation() {
        let result = clock.convert(time: "13:17:01")

        XCTAssertEqual(result, [
            "O",
            "RROO",
            "RRRO",
            "YYROOOOOOOO",
            "YYOO"
        ])
    }

    /// At 23:59:59, the Berlin Clock should return the correct lamp states for all rows
    func test_lastSecondOfDay() {
        let result = clock.convert(time: "23:59:59")

        XCTAssertEqual(result, [
            "O",
            "RRRR",
            "RRRO",
            "YYRYYRYYRYY",
            "YYYY"
        ])
    }
}


