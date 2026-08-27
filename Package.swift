// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-symmetry-algebra",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Symmetry Algebra",
            targets: ["Symmetry Algebra"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-symmetry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-algebra.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Symmetry Algebra",
            dependencies: [
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Algebra", package: "swift-algebra"),
            ]
        ),
        .testTarget(
            name: "Symmetry Algebra Tests",
            dependencies: [
                "Symmetry Algebra",
                .product(name: "Symmetry", package: "swift-symmetry"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
