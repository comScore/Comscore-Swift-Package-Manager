// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.12.1"
    static let checksum: String = "35c69ea0b0152ab86165f4923eacf66cbf00c4b8755782dd2a2a23f1b5f86147"
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
