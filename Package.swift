// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "v6.8.0"
    static let checksum: String = "a51398faaddab12229091c40a50ba057d74d92278591cb656a6b88dac463d89e"
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
