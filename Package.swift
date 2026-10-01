// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SkektecCapacitorContacts",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SkektecCapacitorContacts",
            targets: ["ContactsPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "ContactsPluginObjC",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Plugin",
            sources: ["ContactsPlugin.m"],
            publicHeadersPath: "."
        ),
        .target(
            name: "ContactsPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                "ContactsPluginObjC"
            ],
            path: "ios/Plugin",
            exclude: ["Info.plist", "ContactsPlugin.m", "ContactsPlugin.h"]
        )
    ]
)
