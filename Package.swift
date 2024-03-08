// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.12.0"
    static let checksum: String = "8326e66156dc420afc844d906049e029119ee4e5fceffb3c179dd52e0283bec2"
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
