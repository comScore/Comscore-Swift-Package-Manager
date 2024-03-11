// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.12.2"
    static let checksum: String = "3707d34aa08c038d7648b430bf2fc0000180332597c29998b1e35cbe1a1abd8f"
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
