# GradientBuilder

For design detail, read [Go through swift result builders](https://chenhaiteng.github.io/swift/2021/08/16/go-through-swift-result-builders.html)

## Installation:

### CocoaPods
GradientBuilder is now available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GradientBuilder'
```

### Swift Package Manager
GradientBuilder is published with Swift Package Manager, you can get more information at ![Swift Package Manager(GitHub)](https://github.com/apple/swift-package-manager), ![Package Manager(swift.org)](https://swift.org/package-manager/), and ![Swift Packages(Apple)](https://developer.apple.com/documentation/swift_packages)

#### - Add to Xcode(To use this package in your application):

1. File > Swift Packages > Add Package Dependency...
2. Choose Project you want to add GradientBuilder
3. Paste repository https://github.com/chenhaiteng/GradientBuilder.git
4. Rules > Version: Up to Next Major 1.0.0
It's can also apply Rules > Branch : main to access the latest code.

**Note:** It might need to link GradientBuilder to your target maunally.
1. Open *Project Editor* by tap on root of project navigator
2. Choose the target you want to use GradientBuilder.
3. Choose **Build Phases**, and expand **Link Binary With Libraries**
4. Tap on **+** button, and choose GradientBuilder to add it.

#### - Add to SPM package(To use this package in your library/framework):
```swift
dependencies: [
    .package(name: "GradientBuilder", url: " https://github.com/chenhaiteng/GradientBuilder.git", from: "1.0.0")
    // To specify branch, use following statement to instead of.
    // .package(name: "GradientBuilder", url: " https://github.com/chenhaiteng/GradientBuilder.git", .branch("branch_name"))
],
targets: [
    .target(
        name: "MyPackage",
        dependencies: ["GradientBuilder"]),
]
```
---
## How to use

1. apply on function
```swift
// Create a Gradient, then inject it into specified gradient shape.
@GradientBuilder
func builder() -> Gradient {
    Color.red
    Color.blue
    Color.yellow
}

let g = builder()
let angularGradient = AngularGradient(gradient: g, center: .center)

// Or create gradient shape directly
@GradientBuilder
func angularBuilder() -> AngularGradient {
    Color.red
    Color.blue
    Color.yellow
}

let angular = angularBuilder()
```

2. apply on a arameter in a function declaration
```swift
func createGradient(@GradientBuilder builder: ()->Gradient) -> Gradient {
    return builder()
}

let g = createGradient {
    Color.red
    Color.blue
    Color.yellow
}
```

3. apply on a variable or subscript
```swift
enum GrayGradient {
    @GradientBuilder static subscript(_ degree: Int) -> LinearGradient {
        if degree > 0 {
            for i in 0..<degree {
                Color.white.opacity(Double(i)/Double(degree))
            }
        } else {
            Color.white
        }
    }
}

let gray_g = GrayGradient[3]
```

4. Support different input types
```swift
let g = createGradient {
    (1.0, 1.0, 1.0, 0.5) //RGBA with float, value from 0.0 to 1.0
    (255, 255, 255, 210) //RGBA8888 format, vlaue from 0 to 255
    Color.white // Color 
}

let g_stop = createGradient {
    Gradient.Stop(color: .red, location: 0.2)
    (Color.blue, 0.5)
    (.green, 0.7)
}
```

Note that it's **NOT** allow to mix Color with Stop:
```swift
let g = createGradient {
    (1.0, 1.0, 1.0, 0.5) //RGBA with float, value from 0.0 to 1.0
    (255, 255, 255, 210) //RGBA8888 format, vlaue from 0 to 255
    (.green, 0.7) // Invalid!!! show ambiguous error!!!!
}
```
