// swift-tools-version:5.3

import PackageDescription

struct PackageMetadata {
    static let version: String = "6.6.0"
    static let checksum: String = "a56c3f903cc106c03d4c6720cd400211ae31df1fd05d6accb3c6aa9689cb22c4"
}

let package = Package(
    name: "ComScore",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "ComScore",
            targets: ["ComScore"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "ComScore",
            path: "ComScore.xcframework.zip"
        )
    ]
)
