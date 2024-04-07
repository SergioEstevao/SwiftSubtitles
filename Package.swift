// swift-tools-version: 5.4

import PackageDescription

let package = Package(
	name: "SwiftSubtitles",
	platforms: [
		.macOS(.v10_13),
		.iOS(.v12),
		.tvOS(.v12),
		.watchOS(.v6)
	],
	products: [
		.library(
			name: "SwiftSubtitles",
			targets: ["SwiftSubtitles"]),
	],
	dependencies: [
		.package(url: "https://github.com/dagronf/DSFRegex", from: "3.3.1"),
		.package(url: "https://github.com/dagronf/TinyCSV", .upToNextMinor(from: "1.0.0")),
		.package(url: "https://github.com/1024jp/GzipSwift", .upToNextMinor(from: "6.0.1"))
	],
	targets: [
		.target(
			name: "SwiftSubtitles",
			dependencies: ["DSFRegex", "TinyCSV"],
			resources: [
				.copy("PrivacyInfo.xcprivacy"),
			]
		),
		.testTarget(
			name: "SwiftSubtitlesTests",
			dependencies: [
				"SwiftSubtitles",
				.product(name: "Gzip", package: "GzipSwift")
			],
			resources: [
				.process("resources"),
			]
		),
	]
)
