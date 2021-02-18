// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.7.1"
    static let checksum: String = "62c149500be528acbc154500a4cd3cceafc84931db66f4056d6aa0f65a0beabc"
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
