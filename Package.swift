// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v4.5"
    static let checksum: String = "8dec284678e26467371a4d896add21694182323ecc50c4735216f1f139c63de3"
}

let package = Package(
    name: "ComScore",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2)
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
