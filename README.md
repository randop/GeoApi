# Swift GeoApi

<p align="center">
    <a href="https://circleci.com/gh/randolphledesma/GeoApi">
        <img src="https://circleci.com/gh/randolphledesma/GeoApi.svg?style=svg" alt="Circle-CI Build Status" />
    </a>
    <a href="https://travis-ci.org/randop/GeoApi">
        <img src="https://travis-ci.org/randop/GeoApi.svg?branch=master&style=flat" alt="Travis-CI Build Status">
    </a>
    <a href="https://github.com/randop/GeoApi">
        <img src="https://img.shields.io/badge/swift-3-blue.svg" alt="Swift3" />
    <a>
    <a href="https://github.com/randop/GeoApi">
        <img src="https://img.shields.io/badge/swift-4-blue.svg" alt="Swift4" />
    <a>
    <a href="https://github.com/randop/GeoApi">
        <img src="https://img.shields.io/badge/platforms-ios%20%7C%20osx%20%7C%20linux-lightgrey.svg" alt="Platforms">
    </a>
    <a href="https://github.com/randop/GeoApi">
        <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager Compatible">
    </a>
    <a href="https://github.com/randop/GeoApi/blob/master/LICENSE">
        <img src="https://img.shields.io/github/license/mashape/apistatus.svg" alt="MIT License" >
    </a>
</p>

### Installation with SPM on Swift 4

``` swift
import PackageDescription

let package = Package(
    name: "MyProject",
    dependencies: [
        .package(url: "https://github.com/randop/GeoApi.git", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "MyProject",
            dependencies: ["GeoApi"]),
    ]
)
```

### Installation with SPM on Swift 3

``` swift
import PackageDescription

let package = Package(
  name: "GeoApi",
  dependencies: [
    .Package(url: "https://github.com/randop/GeoApi.git", majorVersion: 1, minor: 0)
  ]
)
```

## Usage

### Address Latitude and Longitude

``` swift
import GeoApi

let location = "Cardinal Rosales Ave, Cebu City, Cebu 6000, Philippines"

let client = GeoApi(apikey: "")
let (latitude, longitude) = client.geocode(address: location)
```

### Distance Between Addresses

``` swift
import GeoApi

let client = GeoApi(apikey: "")

let location1 = "Cardinal Rosales Ave, Cebu City, Cebu 6000, Philippines"
let location2 = "Jose Maria del Mar St, Apas, Cebu City, Cebu 6000, Philippines"

let distance = client.miles(from: location1, to: location2)
```
