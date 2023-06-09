// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "chat-terminal",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .executable(name: "chat", targets: ["chat-terminal"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/adamrushy/OpenAISwift.git", from: "1.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "chat-terminal",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "OpenAISwift", package: "OpenAISwift")
            ]
        ),
        .testTarget(
            name: "chat-terminalTests",
            dependencies: ["chat-terminal"]),
    ]
)
