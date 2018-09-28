// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TP1",
    dependencies: [
      .package(url: "https://github.com/damdamo/PetriKit.git", from: "2.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TP1",
            dependencies: ["TP1Lib"]),
        .target(
            name: "TP1Lib",
            dependencies: ["PetriKit"]),
        .testTarget(
            name: "TP1Tests",
            dependencies: ["TP1Lib"]),
    ]
)
