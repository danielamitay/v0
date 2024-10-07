//
//  View+Shake.swift
//  v0
//
//  Created by Daniel Amitay on 10/7/24.
//

import SwiftUI

/// Shake gesture phase
public enum ShakePhase {
    /// Shake gesture began
    case began
    /// Shake gesture ended
    case ended
    /// Shake gesture cancelled
    case cancelled
}

public extension View {
    /// Adds a shake gesture to the view
    func onShake(_ block: @escaping (_ phase: ShakePhase) -> Void) -> some View {
        self.overlay {
            // I wonder if it is possible to find a way to have just one of these on the entire app?
            ShakeViewRepresentable(onShake: block)
                .allowsHitTesting(false)
                .opacity(0.0)
        }
    }
}

/// Internal shake gesture representable
internal struct ShakeViewRepresentable: UIViewControllerRepresentable {
    let onShake: (ShakePhase) -> ()

    /// Internal shake view controller
    class ShakeViewController: UIViewController {
        let onShake: ((ShakePhase) -> ())
        init(onShake: @escaping (ShakePhase) -> Void) {
            self.onShake = onShake
            super.init(nibName: nil, bundle: nil)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                onShake(.began)
            }
            super.motionBegan(motion, with: event)
        }
        override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                onShake(.ended)
            }
            super.motionEnded(motion, with: event)
        }
        override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                onShake(.cancelled)
            }
            super.motionCancelled(motion, with: event)
        }
    }
    func makeUIViewController(context: Context) -> ShakeViewController {
        return ShakeViewController(onShake: onShake)
    }
    func updateUIViewController(_ uiViewController: ShakeViewController, context: Context) {
        // no-op
    }
}
