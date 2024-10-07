//
//  Task+Sleep.swift
//  v0
//
//  Created by Daniel Amitay on 10/6/24.
//

public extension Task where Success == Never, Failure == Never {
    /// Sleeps for the given number of seconds
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
