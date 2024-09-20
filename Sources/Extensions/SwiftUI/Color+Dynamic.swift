//
//  Color+Dynamic.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import SwiftUI

extension Color {
    static func dynamic(light: Color, dark: Color) -> Color {
        return .init(UIColor.dynamic(light: UIColor(light), dark: UIColor(dark)))
    }
}
