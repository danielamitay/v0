//
//  Clamped.swift
//  v0
//
//  Created by Rudd Fawcett on 9/24/24.
//

public extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}