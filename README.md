# EggLoadingView
[![Version](https://img.shields.io/cocoapods/v/EggLoadingView.svg?style=flat)](https://cocoapods.org/pods/EggLoadingView)
[![Platform](https://img.shields.io/cocoapods/p/EggLoadingView.svg?style=flat)](https://cocoapods.org/pods/EggLoadingView)
[![Swift Version](https://img.shields.io/badge/Swift-5.0-green.svg?style=flat)](https://cocoapods.org/pods/EggLoadingView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 11.0+
Swift 5.0+

## Installation

EggLoadingView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EggLoadingView'
```

And then run:
```ruby
pod install
```

After installing the cocoapod into your project import EggLoadingView with
```ruby
import EggLoadingView
```

## Usage 
```ruby
import UIKit
import EggLoadingView

class ViewController: UIViewController {
    
    # initialize loading view 
    let loadingView = EggLoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        # DON'T write ".gif" after gif image name
        self.loadingView.loadingImageName = "loading"
        self.loadingView.closeButtonImageName = "doggo"
        self.loadingView.delegate = self
        
        # Call this method to show Loading View
        # If you want to close Loading View, change isLoading to false
        self.loadingView.showLoadingView(isLoading: true, hasCloseBtn: true)
    }
}

// MARK: - EggLoadingViewDelegate
extension ViewController: EggLoadingViewDelegate {
    func pressCloseButton(_ button: UIButton) {
        print("Close Button Click")
    }
}
```
## Customization
```ruby
self.loadingView.bgColor = UIColor.black.withAlphaComponent(0.7)
self.loadingView.imageWidth = 150
self.loadingView.imageHeight = 150
self.loadingView.titleText = "Hello"
self.loadingView.titleColor = .red
self.loadingView.loadingImageName = "gifName"
self.loadingView.closeButtonImageName = "closeImageName"
```

## Author

Thanavat Chaopaknam, thanavat.chao@gmail.com

## License

EggLoadingView is available under the MIT license. See the LICENSE file for more info.
