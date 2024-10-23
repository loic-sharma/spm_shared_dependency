// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "plugin_one",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "plugin-one", targets: ["plugin_one"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/example-package-playingcard.git", from: "3.0.5"),
    ],
    targets: [
        .target(
            name: "plugin_one",
            dependencies: [
                .product(name: "PlayingCard", package: "example-package-playingcard")
            ],
            resources: [
                // If your plugin requires a privacy manifest, for example if it uses any required
                // reason APIs, update the PrivacyInfo.xcprivacy file to describe your plugin's
                // privacy impact, and then uncomment these lines. For more information, see
                // https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
                // .process("PrivacyInfo.xcprivacy"),

                // If you have other resources that need to be bundled with your plugin, refer to
                // the following instructions to add them:
                // https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
            ]
        )
    ]
)
