//
//  TimeInterval+Intervals.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import Foundation

public extension TimeInterval {
    static let minute: TimeInterval = 60
    static let hour: TimeInterval = 60 * minute
    static let day: TimeInterval = 24 * hour
    static let week: TimeInterval = 7 * day

    // Worth noting that months and years are not constant intervals!
    static let month: TimeInterval = 30 * day
    static let year: TimeInterval = 365 * day
}
