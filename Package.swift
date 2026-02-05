// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.16.0"
    static let checksum: String = "45bb08ca418d84bd5ad779e3829cee1326c1185b068f96c566e8985baca82d03"
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
