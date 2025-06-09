// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xLocalizr",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "xLocalizr-cli", targets: ["xLocalizr-cli"]),
        .executable(name: "xLocalizr-macOS", targets: ["xLocalizr-macOS"])
    ],
    targets: [
        .target(
            name: "Shared",
            path: "Sources/Shared"
        ),
        .executableTarget(
            name: "xLocalizr-cli",
            dependencies: ["Shared"],
            path: "Sources/Command"
        ),
        .executableTarget(
            name: "xLocalizr-macOS",
            dependencies: ["Shared"],
            path: "Sources/App"
        )
    ]
)
