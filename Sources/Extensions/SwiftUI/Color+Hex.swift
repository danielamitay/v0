//
//  Color+Hex.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import SwiftUI

extension Color {
    static func hex(_ hex: Int, alpha: CGFloat = 1) -> Color {
        return Color(uiColor: .hex(hex, alpha: alpha))
    }

    init(hex: Int, alpha: CGFloat = 1) {
        self.init(uiColor: .init(hex: hex, alpha: alpha))
    }
}
