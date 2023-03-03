// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "swift-indirect",
	 platforms: [
		 .iOS(.v13),
		 .macOS(.v10_15),
		 .tvOS(.v13),
		 .watchOS(.v6)
	 ],
    products: [
        .library(
            name: "Indirect",
            targets: ["Indirect"]
		  )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Indirect",
            dependencies: []
		  ),
        .testTarget(
            name: "IndirectTests",
            dependencies: ["Indirect"]
		  )
    ]
)
