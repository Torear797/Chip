// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Chip",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Chip", targets: ["Chip"]),
    ],
    targets: [
        .target(name: "Chip"),
        .testTarget(name: "ChipTests", dependencies: ["Chip"]),
    ],
    swiftLanguageVersions: [.v5]
)
