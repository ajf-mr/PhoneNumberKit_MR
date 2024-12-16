// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "PhoneNumberKit_MR",
    platforms: [
        .iOS(.v12), .macOS(.v10_13), .tvOS(.v12), .watchOS(.v4)
    ],
    products: [
        .library(name: "PhoneNumberKit_MR", targets: ["PhoneNumberKit_MR"]),
        .library(name: "PhoneNumberKit_MR-Static", type: .static, targets: ["PhoneNumberKit_MR"]),
        .library(name: "PhoneNumberKit_MR-Dynamic", type: .dynamic, targets: ["PhoneNumberKit_MR"])
    ],
    targets: [
        .target(name: "PhoneNumberKit_MR",
                path: "PhoneNumberKit",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update_metadata.sh",
                          "Info.plist"],
                resources: [
                    .process("Resources/PhoneNumberMetadata.json"),
                    .copy("Resources/PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "PhoneNumberKitTests_MR",
                    dependencies: ["PhoneNumberKit_MR"],
                    path: "PhoneNumberKitTests",
                    exclude: ["Info.plist"])
    ]
)
