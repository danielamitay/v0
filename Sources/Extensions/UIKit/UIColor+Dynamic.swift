//
//  UIColor+Dynamic.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import UIKit

public extension UIColor {
    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor { trait in
            switch trait.userInterfaceStyle {
            case .dark:
                return dark
            case .light:
                return light
            case .unspecified:
                return light
            @unknown default:
                return light
            }
        }
    }
}
