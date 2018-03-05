import PackageDescription

let package = Package(name: "GeoApi")

#if swift(>=4.0)
    let product = Library(name: "GeoApi", targets: ["GeoApi"])
    package.products.append(product)

    let target = Target(name: "GeoApi")
    package.targets.append(target)
    
    let testTarget = Target(name: "GeoApiTests", dependencies: ["GeoApi"])
    package.targets.append(testTarget)
#else
    //Swift 3
    let target = Target(name: "GeoApi")
    package.targets.append(target)
    
    let testTarget = Target(name: "GeoApiTests", dependencies: ["GeoApi"])
    package.targets.append(testTarget)
#endif
    