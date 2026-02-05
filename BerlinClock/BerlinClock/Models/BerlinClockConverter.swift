//
//  BerlinClockConverter.swift
//  BerlinClock
//
//  Created by Me on 05/02/2026.
//


/// BerlinClockConverter is responsible for converting a standard time string (HH:MM:SS)
/// into the Berlin Clock representation as an array of strings.
final class BerlinClockConverter {

    /// Converts a time string into Berlin Clock rows
    /// - Parameter time: a string formatted as "HH:MM:SS"
    /// - Returns: an array of 5 strings representing the Berlin Clock rows
    func convert(time: String) -> [String] {
        let components = time.split(separator: ":").compactMap { Int($0) }

        let hours = components[0]
        let minutes = components[1]
        let seconds = components[2]

        return [
            secondRow(seconds),
            fiveHourRow(hours),
            oneHourRow(hours),
            fiveMinuteRow(minutes),
            oneMinuteRow(minutes)
        ]
    }

    // MARK: - Seconds

    /// Returns the state of the seconds lamp (top lamp)
    /// "Y" if seconds are even, "O" if odd
    private func secondRow(_ seconds: Int) -> String {
        return seconds % 2 == 0 ? "Y" : "O"
    }

    // MARK: - Hours

    /// Returns the 5-hour row as a string of 4 lamps
    /// "R" for on, "O" for off
    private func fiveHourRow(_ hours: Int) -> String {
        let on = hours / 5
        return String(repeating: "R", count: on)
             + String(repeating: "O", count: 4 - on)
    }

    /// Returns the 1-hour row as a string of 4 lamps
    /// "R" for on, "O" for off
    private func oneHourRow(_ hours: Int) -> String {
        let on = hours % 5
        return String(repeating: "R", count: on)
             + String(repeating: "O", count: 4 - on)
    }

    // MARK: - Minutes

    /// Returns the 5-minute row as a string of 11 lamps
    /// "Y" for normal 5-minute lamps, "R" for every 15th minute, "O" for off
    private func fiveMinuteRow(_ minutes: Int) -> String {
        let on = minutes / 5

        return (0..<11).map { index in
            if index < on {
                return (index + 1) % 3 == 0 ? "R" : "Y"
            } else {
                return "O"
            }
        }.joined()
    }

    /// Returns the 1-minute row as a string of 4 lamps
    /// "Y" for on, "O" for off
    private func oneMinuteRow(_ minutes: Int) -> String {
        let on = minutes % 5
        return String(repeating: "Y", count: on)
             + String(repeating: "O", count: 4 - on)
    }
}
