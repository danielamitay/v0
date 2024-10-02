//
//  Rounded.swift
//  v0
//
//  Created by Daniel Amitay on 10/1/24.
//

import CoreFoundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension CGRect {
    /// Rounds the CGRect to integer values
    func rounded() -> CGRect {
        return CGRect(
            x: origin.x.rounded(),
            y: origin.y.rounded(),
            width: size.width.rounded(),
            height: size.height.rounded()
        )
    }
}

extension CGPoint {
    /// Rounds the CGPoint to integer values
    func rounded() -> CGPoint {
        return CGPoint(
            x: x.rounded(),
            y: y.rounded()
        )
    }
}

extension CGSize {
    /// Rounds the CGSize to integer values
    func rounded() -> CGSize {
        return CGSize(
            width: width.rounded(),
            height: height.rounded()
        )
    }
}
