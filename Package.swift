// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.11.0"
    static let checksum: String = "f2e52a1a0042db9a9822773b7bc1d07e14ba889029539dff654a4cfd38a12420"
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
