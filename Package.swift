// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAdwaita",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Adwaita",
            targets: ["Adwaita"]),
        .executable(name: "Demo", targets: ["Demo"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
   	.package(url: "https://github.com/rhx/gir2swift.git", branch: "main"),
        .package(url: "https://github.com/rhx/SwiftGtk.git", branch: "gtk4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .systemLibrary(name: "CAdwaita", pkgConfig: "libadwaita-1", providers: [
    		.apt(["libadwaita-1-0"])	
    	]),
        .target(
            name: "Adwaita",
            dependencies: [
            	"CAdwaita",
            	.product(name: "gir2swift", package: "gir2swift"),
            	.product(name: "Gtk", package: "SwiftGtk")
            ],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"], .when(configuration: .release)),
                .unsafeFlags(["-suppress-warnings", "-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug)),
            ],
            plugins: [
            	.plugin(name: "gir2swift-plugin", package: "gir2swift")
            ]),
        .executableTarget(name: "Demo", dependencies: [
        	"Adwaita"
        ]),
        .testTarget(
            name: "AdwaitaTests",
            dependencies: ["Adwaita"]),
    ]
)
