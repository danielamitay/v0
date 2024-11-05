//
//  Color+Luminance.swift
//  v0
//
//  Created by Daniel Amitay on 11/4/24.
//

import SwiftUI
import UIKit

public extension Color {
    /// Returns the luminance of the color.
    var luminance: Double {
        return UIColor(self).luminance
    }
}
