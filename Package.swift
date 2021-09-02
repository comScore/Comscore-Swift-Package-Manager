// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.9.0"
    static let checksum: String = "c8801ef38df548fb3e03791b0e3975a0dd8974c80640aeb473edb859c1c15a22"
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
