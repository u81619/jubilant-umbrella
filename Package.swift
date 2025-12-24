// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SimpleTableApp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SimpleTableApp",
            targets: ["SimpleTableApp"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SimpleTableApp",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "SimpleTableAppTests",
            dependencies: ["SimpleTableApp"]),
    ]
)
