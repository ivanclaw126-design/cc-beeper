// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CC-Beeper",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/ivanclaw126-design/FluidAudio.git", revision: "fecfe09b33bc38210be85e9737264c00e8d9392a"),
        .package(url: "https://github.com/soffes/HotKey.git", from: "0.2.1"),
        .package(url: "https://github.com/argmaxinc/WhisperKit.git", from: "0.17.0"),
    ],
    targets: [
        .executableTarget(
            name: "CC-Beeper",
            dependencies: [
                .product(name: "FluidAudio", package: "FluidAudio"),
                .product(name: "HotKey", package: "HotKey"),
                .product(name: "WhisperKit", package: "WhisperKit"),
            ],
            path: "Sources",
            exclude: [
                "shells",
                "buttons",
                "shell.svg",
            ],
            swiftSettings: [
                .swiftLanguageMode(.v5),
            ],
            linkerSettings: []
        ),
        .testTarget(
            name: "CC-BeeperTests",
            dependencies: [
                .product(name: "FluidAudio", package: "FluidAudio"),
            ],
            path: "Tests/CC-BeeperTests"
        )
    ]
)
