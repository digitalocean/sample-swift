// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SampleSwift",
    dependencies: [
        .package(name: "Swifter", url: "https://github.com/httpswift/swifter.git", .upToNextMajor(from: "1.5.0"))
    ],
    targets: [
        .target(
            name: "SampleSwift",
            dependencies: ["Swifter"],
            path: "./Sources")
    ]
)