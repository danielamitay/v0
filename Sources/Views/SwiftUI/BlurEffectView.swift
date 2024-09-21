//
//  BlurEffectView.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import SwiftUI

public struct BlurEffectView: View {
    let style: UIBlurEffect.Style

    public var body: some View {
        VisualEffectView(effect: UIBlurEffect(style: style))
    }
}

#Preview {
    ZStack {
        Circle().padding(10)
        BlurEffectView(style: .regular).padding(44)
    }
}
