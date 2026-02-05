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

}


