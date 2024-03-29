// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MHAboutViewController",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MHAboutViewController",
            targets: ["MHAboutViewController"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/bizz84/SwiftyStoreKit", from: "0.16.4"),
        .package(url: "https://github.com/rizumita/CTFeedbackSwift", from: "0.1.9")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MHAboutViewController",
            dependencies: ["SwiftyStoreKit", "CTFeedbackSwift"]),
        .testTarget(
            name: "MHAboutViewControllerTests",
            dependencies: ["MHAboutViewController"]),
    ]
)
