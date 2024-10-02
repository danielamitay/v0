//
//  Clamped.swift
//  v0
//
//  Created by Rudd Fawcett on 9/24/24.
//

public extension Comparable {
    /// Clamps the value to a given range.
    func clamped(to range: ClosedRange<Self>) -> Self {
        return clamp(self, range.lowerBound, range.upperBound)
    }
}

/// Clamps a value to a given range.
@inlinable public func clamp<T>(_ value: T, _ min: T, _ max: T) -> T where T : Comparable {
    return Swift.min(Swift.max(value, min), max)
}
