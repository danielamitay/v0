//
//  Synchronized.swift
//  v0
//
//  Created by Daniel Amitay on 10/6/24.
//

import ObjectiveC

@discardableResult
/// Swift version of @synchronized
public func synchronized<T>(_ lock: AnyObject, _ closure: () throws -> T) rethrows -> T {
    objc_sync_enter(lock)
    defer { objc_sync_exit(lock) }
    return try closure()
}
