// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.7.0"
    static let checksum: String = "17547be7afe148b9fec99337dc83074ddf7cce45bf59ab623d35534959de32b3"
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
