// swift-tools-version:5.3
import PackageDescription

struct PackageMetadata {
    static let version: String = "6.14.0"
    static let checksum: String = "d8eb53df50aa3b79635a5759a667abdef0535212c534feca9000320617022f77"
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
