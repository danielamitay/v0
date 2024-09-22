//
//  View+WithoutAnimation.swift
//  v0
//
//  Created by Daniel Amitay on 9/21/24.
//

import SwiftUI

public extension View {
    func withoutAnimation(action: @escaping () -> Void) {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction, action)
    }
}
