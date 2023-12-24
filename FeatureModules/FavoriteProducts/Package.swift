// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoriteProducts",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FavoriteProducts",
            targets: ["FavoriteProducts"]),
    ],
    dependencies: [
        .package(path: "Repository"),
        .package(path: "ShopProducts"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FavoriteProducts",
            dependencies: [
                "Repository",
                "ShopProducts",
            ]),
        .testTarget(
            name: "FavoriteProductsTests",
            dependencies: ["FavoriteProducts"]),
    ]
)
