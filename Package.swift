// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.15.0"
    static let checksum: String = "ba921486d252e78c23182041f5684758744fccc3ff3ae1be1f1b2cbfdc7112f7"
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
