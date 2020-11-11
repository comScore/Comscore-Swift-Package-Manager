// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v5.0.0"
    static let checksum: String = "2eef00511d1bf2685a7eb7e49506c5e8ae3d16faa57e050ffb9d327f0859299e"
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
