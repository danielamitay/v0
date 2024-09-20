//
//  UIColor+Hex.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import UIKit

public extension UIColor {
    static func hex(_ hex: Int, alpha: CGFloat = 1) -> UIColor {
        return UIColor(hex: hex, alpha: alpha)
    }

    convenience init(hex: Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex >> 16) & 0xff) / 255,
            green: CGFloat((hex >> 08) & 0xff) / 255,
            blue: CGFloat((hex >> 00) & 0xff) / 255,
            alpha: alpha
        )
    }
}
