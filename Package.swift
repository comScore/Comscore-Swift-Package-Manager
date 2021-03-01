// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.7.1"
    static let checksum: String = "ff0f53409d1fa94682b162c2e186fb3244b4a3d5331c64f97cd4a9e55023f14b"
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
