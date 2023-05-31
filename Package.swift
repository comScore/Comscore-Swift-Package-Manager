// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.10.1"
    static let checksum: String = "171938820fc73a38aebba9f7b36885995c9bd7726415295dc7e01d5dcc0dfe5e"
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
