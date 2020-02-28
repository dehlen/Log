# Log
<img src="https://img.shields.io/badge/supports-Swift%20Package%20Manager-green.svg">
<img src="./docs/badge.svg">
<img src="https://img.shields.io/badge/Swift-5-orange">
<img src="https://img.shields.io/badge/Platforms-iOS | macOS-lightgrey">

A simple and extensible logging framework for macOS and iOS.

## Installation

Currently only Swift Package Manager is supported. 
Swift Package Manager is a dependency manager built into Xcode.

If you are using Xcode 11 or higher, go to File / Swift Packages / Add Package Dependency... and enter package repository URL https://github.com/dehlen/Log.git, then follow the instructions.

To remove the dependency, select the project and open Swift Packages (which is next to Build Settings). You can add and remove packages from this tab.

## Usage

> Create loggers that conform to `LogStore` and add to `LogProvider` (console and `os_log` are included):
```swift
let log: LogProviderType = LogProvider(
    stores: [
        LogConsoleStore(minLevel: .debug),
        LogOSStore(
            minLevel: .warning,
            subsystem: "com.davidehlen.Log",
            category: "Application"
        ),
        MyCustomLogger()
    ]
)

log.error("There was an error.")
```

## Documentation
The documentation is generated thanks to [jazzy](https://github.com/realm/jazzy).

You can find the latest version here: [Documentation](./docs).

## License
The MIT License

Copyright (c) 2020 David Ehlen

See LICENSE file

