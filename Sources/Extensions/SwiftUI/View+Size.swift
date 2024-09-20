//
//  View+Size.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import SwiftUI

public extension View {
    func frame(size: CGSize, alignment: Alignment = .center) -> some View {
        self.frame(width: size.width, height: size.height, alignment: alignment)
    }

    func takeSafeArea(_ insets: Binding<EdgeInsets>) -> some View {
        self.modifier(SafeAreaModifier(insets))
    }

    func takeSize(_ size: Binding<CGSize>) -> some View {
        self.modifier(SizeModifier(size))
    }
}

fileprivate struct SizeModifier: ViewModifier {
    @Binding var size: CGSize

    init(_ size: Binding<CGSize>) {
        _size = size
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { preference in
                self.size = preference
            }
    }

    struct SizePreferenceKey: PreferenceKey {
        typealias V = CGSize

        static var defaultValue: V = .zero

        static func reduce(value: inout V, nextValue: () -> V) {
            value = nextValue()
        }
    }
}

fileprivate struct SafeAreaModifier: ViewModifier {
    @Binding var insets: EdgeInsets

    init(_ insets: Binding<EdgeInsets>) {
        _insets = insets
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: SafeAreaPreferenceKey.self, value: proxy.safeAreaInsets)
                }
            )
            .onPreferenceChange(SafeAreaPreferenceKey.self) { preference in
                self.insets = preference
            }
    }

    struct SafeAreaPreferenceKey: PreferenceKey {
        typealias V = EdgeInsets

        static var defaultValue: V = .init()

        static func reduce(value: inout V, nextValue: () -> V) {
            value = nextValue()
        }
    }
}
