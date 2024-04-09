// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.12.3"
    static let checksum: String = "4b0d794af348534fc1779d3178e0d840aa5baa9250d7ae4a59336c043de3f227"
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
