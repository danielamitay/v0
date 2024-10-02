//
//  Array+Chunked.swift
//  v0
//
//  Created by Daniel Amitay on 10/1/24.
//

import Foundation

extension Array {
    /// Splits the array into chunks of the given size
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
