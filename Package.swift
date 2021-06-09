// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.8.1"
    static let checksum: String = "ee687cb302130bac4b34f24e3def006405025e37f2622be4ca2e125e708b6961"
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
