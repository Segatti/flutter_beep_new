// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_beep_new",
    platforms: [
        .iOS("13.0"),
    ],
    products: [
        .library(name: "flutter-beep-new", targets: ["flutter_beep_new"]),
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
    ],
    targets: [
        .target(
            name: "flutter_beep_new",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
            ],
            cSettings: [
                .headerSearchPath("include/flutter_beep_new"),
            ]
        ),
    ]
)
