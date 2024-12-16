// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.14.1"
    static let checksum: String = "951ea93ef798ef80271b91fe0ef6b2941395009bfedc9675114b1995715caa19"
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
