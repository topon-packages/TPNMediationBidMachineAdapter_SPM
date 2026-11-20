// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "TPNMediationBidMachineAdapter",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "TPNMediationBidMachineAdapter",
            targets: ["TPNMediationBidMachineAdapterTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/topon-packages/TPNiOS_SPM.git", from: "6.5.60"),
        .package(url: "https://github.com/bidmachine/BidMachine-SPM.git", exact: "3.8.2")
    ],
    targets: [
        .binaryTarget(
            name: "AnyThinkBidMachineAdapter",
            url: "https://topon-sdk-release.oss-accelerate.aliyuncs.com/TPN_Release/iosnetwork_2/AnyThinkBidMachineAdapter/30802.2.10/AnyThinkBidMachineAdapter-30802.2.10.zip",
            checksum: "1f4852744ac532d4d20e3b401fdcd8634c173a3cfcf321aee222e9b1dbeca986"
        ),
        .target(
            name: "TPNMediationBidMachineAdapterTarget",
            dependencies: [
                "AnyThinkBidMachineAdapter",
                .product(name: "TPNiOS", package: "TPNiOS_SPM"),
                .product(name: "BidMachine", package: "BidMachine-SPM")
            ],
            path: "Sources/TPNMediationBidMachineAdapterTarget"
        )
    ]
)