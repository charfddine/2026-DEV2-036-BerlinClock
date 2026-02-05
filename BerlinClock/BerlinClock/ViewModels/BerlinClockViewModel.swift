//
//  BerlinClockViewModel.swift
//  BerlinClock
//
//  Created by Me on 05/02/2026.
//

import Foundation
import Combine

/// ViewModel for the Berlin Clock, exposes the current time and the Berlin Clock rows.
/// Updates every second automatically.
final class BerlinClockViewModel: ObservableObject {

    // MARK: - Published Properties

    /// Current time as a string formatted "HH:mm:ss"
    @Published var time: String = ""
    
    /// Berlin Clock rows corresponding to the current time
    @Published var rows: [String] = []

    // MARK: - Private Properties

    /// BerlinClock model instance
    private var clock: BerlinClockConverter

    /// Timer to update the clock every second
    private var timer: Timer?

    // MARK: - Initialization
    
    init(clock: BerlinClockConverter = BerlinClockConverter()) {
        self.clock = clock
        updateTime()  // Set initial time
        startTimer()  // Start the recurring updates
    }

    deinit {
        timer?.invalidate()  // Stop the timer when ViewModel is deallocated
    }

    // MARK: - Timer

    /// Starts the timer to update the time and Berlin Clock every second
    private func startTimer() {
        updateClock() // Initial update immediately

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTime()
        }
    }

    // MARK: - Update Methods

    /// Updates the current time string
    private func updateTime() {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        self.time = formatter.string(from: now) // met à jour le TextField
        updateClock()
    }

    /// Updates the Berlin Clock rows based on the current time
    private func updateClock() {
        rows = clock.convert(time: time)
    }
}
