// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.13.0"
    static let checksum: String = "4eb0357428d077bbf1f964f5a57ed92e31d18753bcaf49be754f6c4f5836e3eb"
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
