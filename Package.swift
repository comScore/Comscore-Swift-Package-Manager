// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.17.0"
    static let checksum: String = "3e49781a291b5eb8df2df91532983e7fa3d4308129c18e4a8bd78645f4c1e812"
}

let package = Package(
    name: "ComScore",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
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
