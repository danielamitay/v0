//
//  UIColor+Luminance.swift
//  v0
//
//  Created by Daniel Amitay on 11/4/24.
//

import UIKit

extension UIColor {
    /// Returns the luminance of the color.
    var luminance: CGFloat {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        // First, try to get RGB components
        if self.getRed(&red, green: &green, blue: &blue, alpha: nil) {
            return 0.299 * red + 0.587 * green + 0.114 * blue
        }

        // If RGB components aren't available, try grayscale
        var white: CGFloat = 0
        if self.getWhite(&white, alpha: nil) {
            return white // Grayscale white level represents luminance directly
        }

        // If neither RGB nor grayscale is available, try HSV
        var brightness: CGFloat = 0
        if self.getHue(nil, saturation: nil, brightness: &brightness, alpha: nil) {
            return brightness // Brightness in HSV can serve as a luminance approximation
        }

        // Fallback luminance if none of the above work
        return 0.5
    }
}
