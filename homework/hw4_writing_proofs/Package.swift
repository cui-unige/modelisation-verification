// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "TP4",
  dependencies: [
    .package(url: "https://github.com/kyouko-taiga/SwiftKanren.git",
  from: "0.3.2"),
    ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "TP4",
      dependencies: ["LogicKit"]),
    .testTarget(
      name: "TP4Tests",
      dependencies: ["TP4"]),
    ]
)
