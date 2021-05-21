// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.8.0"
    static let checksum: String = "ff96f3957115afd7a63c6a9b62f790bf1ab537d4d72905cd4bbb3d58d15b74ab"
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
