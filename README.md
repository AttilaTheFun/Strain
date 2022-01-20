# Strain

A lightweight Swift package with zero dependencies with extensions for writing concise NSLayoutConstraints.

## Requirements

- iOS 13.0+
- Xcode 13.2+
- Swift 5.5+

## Quick Start

```swift
import Strain

class MyViewController: UIViewController {
    private let subview = UIView().with(autolayout: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subview.backgroundColor = .red
        self.view.addSubview(self.subview)
        self.subview.constrainCenter(to: self.view)
        self.subview.constrain(edges: [.leading, .trailing], to: self.view)
        self.subview.constrain(aspectRatio: 16.0/9.0)
    }
}
```

## Installation

Strain is available through Swift Package Manager.
To add it to your project, either use Xcode's Package Dependencies feature, 
or add the following to your Package.swift file:

```swift
    .package(url: "https://github.com/AttilaTheFun/Strain", .upToNextMinor(from: "0.1.0")),
```

## Versioning

While the major version of this package is less than 1.0, it is considered to be in a pre-release state.

While in a pre-release state, minor version updates could be breaking changes, 
while patch updates are reserved for purely additive changes and bug fixes that don't change the API.

Once in a post-release state, this package will follow SemVer versioning with only major version updates including
breaking changes, minor version updates are additive, and patch version updates are reserved for bug fixes and 
performance improvements that do not affect the public API.  

## Author

Logan Shire ([@attilathefun](https://github.com/attilathefun))

## License

Strain is available under the MIT license. See the LICENSE file for more info.
