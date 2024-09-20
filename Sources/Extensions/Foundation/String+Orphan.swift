//
//  String+Orphan.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import Foundation

public extension String {
    var fixOrphan: String {
        // Add zero-width spaces after the last word to prevent orphans
        self + Array(repeating: "\u{200B}", count: 10).joined()
    }
}
