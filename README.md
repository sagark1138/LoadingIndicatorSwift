# LoadingIndicatorSwift
 
 The Loading Indicator package for UIKit projects provides enhanced control over loading indicators, offering globally configurable settings for a seamless user experience. It allows developers to easily customize and manage loading states across the entire application, ensuring consistent and efficient UI behavior.

## Installation Guide

### Swift Package Manager

To install LoadingIndicatorSwift using [Swift Package Manager](https://github.com/swiftlang/swift-package-manager) you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for the LoadingIndicatorSwift repo with the current version:

1. In Xcode, select “File” → “Add Packages...”
2. Enter https://github.com/sagark1138/loading-indicator-swift

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/sagark1138/loading-indicator-swift", from: "1.0.0")
```

## Usage Guide

### **Use default loading indicator without any customisation**

Step 1: Import the package

```swift
import LoadingIndicatorSwift
```

Step 2: Declare the loading indicator

```swift
let loadingIndicator = LoadingIndicator()
```

Step 3: Add the loading indicator to the view hierarchy, lets add in the root view,

<aside>
💡 **Note** that, default indicator style is  ‘indicator’ which will display only indicator view excluding message and background container view.

</aside>

```swift
loadingIndicator.add(in: view)
```

Step 4: Bind loading indicator to show or hide when the state changes

```swift
var isLoading: Bool = false {
    didSet {
        loadingIndicator.isLoading = isLoading
    }
}
```

A loading indicator with default configurations will be display,

- An overlay over the screen
- An indicator which is system activity indicator, and have medium size with grey foreground color

### **Listen to loading indicator states**

Using action (iOS 14+) 

```swift
override func viewDidLoad() {
    super.viewDidLoad() {
        ...
    loadingIndicator.onValueChanged { isLoading in
        print("Loading value changed: \(isLoading)")
    }
        ...
}
```

Using selectors

```swift
override func viewDidLoad() {
    super.viewDidLoad() {
        ...
        loadingIndicator.addTarget(self, action: #selector(loadingValueChanged), for: .valueChanged)
        ...
}

@objc func loadingValueChanged(sender: LoadingIndicator) {
    print(sender.isLoading)
}
```

### **Customise default loading indicator**

### Update size and foreground color

**Always update** loading indicator configurations before adding into parent view to prevent any UI issues. 

```swift
// 1
loadingIndicator.configuration = .standard.copyWith(
    indicator: .standard.copyWith(
        foregroundColor: .red, 
        size: .large
    )
)

// 2
loadingIndicator.add(in: view)
```

There are 4 available sizes:

1. Small : Provides size with width of 40 pts and height of 40 pts
2. Medium: Provides size with width of 60 pts and height of 60 pts
3. Large: Provides size with width of 80 pts and height of 80 pts
4. Custom: Provides custom provided size

Example:

```swift
loadingIndicator.configuration = .standard.copyWith(
    indicator: .standard.copyWith(
        foregroundColor: .red, 
        size: .custom(size: CGSize(width: 100, height: 100))
    )
)
```

### Update overlay color

```swift
loadingIndicator.overlayColor = .systemBlue.withAlphaComponent(0.2)
```

### Show message in loading indicator

Step 1: Set style of loading indicator white adding in parent view

```swift
loadingIndicator.add(in: view, style: .indicator_message)
```

Step 2: Set message to loading indicator

```swift
loadingIndicator.message = "Loading..."
```

<aside>
💡 Note that, Empty message will be hidden in loading indicator

</aside>

### Customise message in loading indicator

### Update font and color

```swift
loadingIndicator.configuration = .standard.copyWith(
    message: .standard.copyWith(
        color: .systemOrange, 
        font: .boldSystemFont(ofSize: 16)
    )
)
```

### Update position relative to indicator

```swift
loadingIndicator.configuration = .standard.copyWith(
    message: .standard.copyWith(
        position: .right
    )
)
```

### Update spacing between indicator and message

```swift
loadingIndicator.configuration = .standard.copyWith(
    message: .standard.copyWith(
        spacing: 8
    )
)
```

### Show container in loading indicator

Set style of loading indicator white adding in parent view

```swift
loadingIndicator.add(in: view, style: .indicator_message_container)
```

### Customise container in loading indicator

### Update background color and corder radius

```swift
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        background: .orange,
        corner: .rounded(all: 20)
    )
)
```

There are 4 options available to configure corners:

1. None : For no corners radius
2. Rounded: Round all corners with specified radius
3. Edge: Round specified corners with specified radius 
4. Capsule: Round corners as capsule

Example:

```swift
// Edge
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        corner: .edge(corners: [.topLeft, .bottomRight], radius: 16)
    )
)

// Rounded
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        corner: .rounded(all: 20)
    )
)

// Capsule
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        corner: .capsule
    )
)

// None
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        corner: Corner.none // Use type to prevent warnings 
    )
)
```

### Add padding to container

```swift
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
            padding: .init(all: 20)
    )
)
```

Below example shows all 3 options to configure padding.

```swift
// All side
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        padding: .init(all: 20)
    )
)

// Edge insets
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        padding: .init(
            edgeInsets: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        )
    )
)

// Symmetric
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
        padding: .init(horizontal: 20, vertical: 10)
    )
)
```

### Add border to container

```swift
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
            border: .init(color: .systemCyan, width: 2), 
    )
)
```

### Add shadow to container

```swift
loadingIndicator.configuration = .standard.copyWith(
    container: .standard.copyWith(
            shadow: .init(
                    color: .darkGray, 
                    offset: .init(width: 0, height: 4), 
                    radius: 8, 
                    opacity: 0.2
            ),
    )
)
```

### Create and use custom loading indicators

### Lottie indicator

Step 1: Add dependency of package Lotte for iOS in your project

Step 2: Download any Lottie animation file and place it inside your projects root bundle

Step 3: Create a new file ‘LottieIndicatorView’ and paste below code inside the file 

```swift
import UIKit
import Lottie

// 1
class LottieIndicatorView: BaseIndicatorView {
    
    // 2
    private lazy var lottieView: LottieAnimationView = {
        let lottieView = LottieAnimationView(name: "send_animation")
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.loopMode = .loop
        lottieView.contentMode = .scaleAspectFit
        return lottieView
    }()
    
    // 3
    override func setup() {
        super.setup()
        
        addSubview(lottieView)
        
        // IMPORTANT: Add constraints to the lottieView
        // eg. 
        lottieView.add(parent: self, fit: .fill)
    }
    
    // 4
    override func start() {
        lottieView.play()
    }
    
    // 5
    override func stop() {
        lottieView.stop()
    }
}
```

1. Conform to BaseIndicatorView to override its behavior.
2. Create a Lottie animation view.
3. Override the setup method and configure Lottie animation view layouts. It's essential to add constraints to the animation view.
4. Override the start method and play the animation within it.
5. Override the stop method and halt the animation within it.

Step 3: Update indicator configurations by setting a LottieIndicatorView instance to 'view' and adjusting the size to fit the animation. 

```swift
loadingIndicator.configuration = .standard.copyWith(
    indicator: .standard.copyWith(
        view: LottieIndicatorView(),
        size: .custom(size: CGSize(width: 300, height: 300))
    )
)
```

That's it, it's ready to use. 

The Lottie animation will now be seamlessly integrated into your loading indicator, providing a visually appealing and customized experience for users. This approach allows for greater flexibility in designing loading indicators that match your app's aesthetic and enhance user engagement during wait times.

### Simple rotating view indicator

Step 1: Create a new file ‘CustomViewIndicator’ and paste below code inside the file 

```swift
import UIKit

// 1
class CustomViewIndicator: BaseIndicatorView {
    
    // 2
    override var foregroundColor: UIColor {
        didSet {
            backgroundColor = foregroundColor
        }
    }
    
    // 3
    override func setup() {
        super.setup()
        
        round(corners: [.bottomLeft, .topRight], radius: 60)
        backgroundColor = foregroundColor
    }
  
      // 4
    override func start() {
        rotate360Degrees()
    }
    
    // 5
    override func stop() {
        layer.removeAllAnimations()
    }
}

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.isCumulative = true
        rotateAnimation.speed = 2.0
        rotateAnimation.repeatCount = Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
```

1. Conform to BaseIndicatorView to override its behavior.
2. Override the setup method to configure the current view, setting the background color and applying corner radius to specific edges.
3. Override the start method to initiate the animation.
4. Override the stop method to halt the animation.

Step 2: Update indicator configurations by setting a CustomViewIndicator instance to 'view' and adjusting the size to fit the animation. 

```swift
loadingIndicator.configuration = .standard.copyWith(
    indicator: .standard.copyWith(
        view: CustomViewIndicator(),
        size: .custom(size: CGSize(width: 100, height: 100))
    )
)
```

That's it, it's ready to use. 

This custom rotating view indicator provides a simple yet visually appealing animation for your loading indicator. By implementing this custom view, you can create a unique loading experience that aligns with your app's design language. Remember to adjust the size, colors, and animation duration as needed to best fit your specific use case.
