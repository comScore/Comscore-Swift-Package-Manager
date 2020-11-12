// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.6.0"
    static let checksum: String = "fbfaff6aede3e9f20ea5ceb07190fe5ccfc6726abc61ad826ffc7d1659aaf2ed"
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
            url: "https://github.com/comScore/Comscore-Swift-Package-Manager/releases/download/\(PackageMetadata.version)/ComScore.xcframework.zip",
            checksum: PackageMetadata.checksum
        )
    ]
)
