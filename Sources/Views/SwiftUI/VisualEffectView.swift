//
//  VisualEffectView.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import SwiftUI
import UIKit

public struct VisualEffectView: UIViewRepresentable {
    public let effect: UIVisualEffect

    public init(effect: UIVisualEffect) {
        self.effect = effect
    }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        return UIVisualEffectView()
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}

#Preview {
    ZStack {
        Circle()
        VStack(spacing: 0) {
            VisualEffectView(effect: UIBlurEffect(style: .regular))
            VisualEffectView(effect: UIBlurEffect(style: .dark))
        }
        .ignoresSafeArea()
    }
}
