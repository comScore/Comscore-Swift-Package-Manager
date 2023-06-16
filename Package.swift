// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.10.2"
    static let checksum: String = "d32484808e1aae028532f565cf471365eae04f13bb14b93c49ec84e411df9161"
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
