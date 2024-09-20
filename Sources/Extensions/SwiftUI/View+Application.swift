//
//  View+Application.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import SwiftUI

extension View {
    func onWillEnterForeground(_ action: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)
        return self.onReceive(publisher) { _ in
            action()
        }
    }

    func onDidEnterBackground(_ action: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)
        return self.onReceive(publisher) { _ in
            action()
        }
    }

    func onDidBecomeActive(_ action: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
        return self.onReceive(publisher) { _ in
            action()
        }
    }

    func onWillResignActive(_ action: @escaping () -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
        return self.onReceive(publisher) { _ in
            action()
        }
    }
}
