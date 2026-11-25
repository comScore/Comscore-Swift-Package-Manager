// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.19.0"
    static let checksum: String = "330faa317bd8e74f36888ac08f5b0a8fae9fa777453ed704fd2808349bae3c4d"
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
