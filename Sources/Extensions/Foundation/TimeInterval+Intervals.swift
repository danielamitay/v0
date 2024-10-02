//
//  TimeInterval+Intervals.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import Foundation

public extension TimeInterval {
    /// A minute in seconds.
    static let minute: TimeInterval = 60
    /// An hour in seconds.
    static let hour: TimeInterval = 60 * minute
    /// A day in seconds.
    static let day: TimeInterval = 24 * hour
    /// A week in seconds.
    static let week: TimeInterval = 7 * day
}

public extension TimeInterval {
    /// Convert the value to milliseconds `TimeInterval`.
    var millisecond: TimeInterval { self / 1000 }
    /// Convert the value to milliseconds `TimeInterval`.
    var milliseconds: TimeInterval { self / 1000 }
    /// Convert the value to milliseconds `TimeInterval`.
    var ms: TimeInterval { self / 1000 }

    /// Convert the value to seconds `TimeInterval`.
    var second: TimeInterval { self }
    /// Convert the value to seconds `TimeInterval`.
    var seconds: TimeInterval { self }

    /// Convert the value to minutes `TimeInterval`.
    var minute: TimeInterval { self * 60 }
    /// Convert the value to minutes `TimeInterval`.
    var minutes: TimeInterval { self * 60 }

    /// Convert the value to hours `TimeInterval`.
    var hour: TimeInterval { self * 3600 }
    /// Convert the value to hours `TimeInterval`.
    var hours: TimeInterval { self * 3600 }

    /// Convert the value to days `TimeInterval`.
    var day: TimeInterval { self * 3600 * 24 }
    /// Convert the value to days `TimeInterval`.
    var days: TimeInterval { self * 3600 * 24 }

    /// Convert the value to weeks `TimeInterval`.
    var week: TimeInterval { self * 3600 * 24 * 7 }
    /// Convert the value to weeks `TimeInterval`.
    var weeks: TimeInterval { self * 3600 * 24 * 7 }
}
