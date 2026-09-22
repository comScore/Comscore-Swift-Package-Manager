// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.18.0"
    static let checksum: String = "02da17f8db1c76738e3883968f4625d2ff03f6667d7f86e2c51210edfca6ec29"
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
