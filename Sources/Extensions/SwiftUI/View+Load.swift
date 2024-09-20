//
//  View+Load.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import SwiftUI

extension View {
    func onLoad(perform action: @escaping (() -> Void)) -> some View {
        self.modifier(ViewLoadModifier(action: action))
    }
}

fileprivate struct ViewLoadModifier: ViewModifier {
    @State private var didLoad = false
    let action: (() -> Void)

    func body(content: Content) -> some View {
        content
            .onAppear {
                if didLoad == false {
                    didLoad = true
                    action()
                }
            }
    }
}
