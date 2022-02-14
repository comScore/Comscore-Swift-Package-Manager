// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.10.0"
    static let checksum: String = "69e3d29070a284f304779ba7d4c789254356520f337620ae0a45ea2289329093"
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
