//
//  String+Email.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//

import Foundation

extension String {
    // Checks if the email is valid just with the minimum rules of:
    // - Contains exactly one @
    // - The string before the @ is not empty
    // - The string after the @ contains a valid domain, where a valid domain consists of:
    //   - Contains at least one .
    //   - The strings separated by the . are not empty
    var isValidEmail: Bool {
        let components = self.components(separatedBy: "@")
        guard components.count == 2 else { return false }
        guard !components[0].isEmpty else { return false }
        let domainComponents = components[1].components(separatedBy: ".")
        guard domainComponents.count > 1 else { return false }
        return domainComponents.allSatisfy { !$0.isEmpty }
    }
}
