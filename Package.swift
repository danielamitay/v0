// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "v0",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "v0",
            targets: ["v0"]
        ),
    ],
    targets: [
        .target(
            name: "v0",
            path: "Sources"
        ),
    ]
)
