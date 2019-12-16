# EggLoadingView
[![Version](https://img.shields.io/cocoapods/v/EggLoadingView.svg?style=flat)](https://cocoapods.org/pods/EggLoadingView)
[![Platform](https://img.shields.io/cocoapods/p/EggLoadingView.svg?style=flat)](https://cocoapods.org/pods/EggLoadingView)
[![Swift Version](https://img.shields.io/badge/Swift-5.0-green.svg?style=flat)](https://cocoapods.org/pods/EggLoadingView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

EggLoadingView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EggLoadingView'
```

## Usage 
```ruby
import UIKit
import EggLoadingView

class ViewController: UIViewController {
    
    // initialize loading view
    let loadingView = EggLoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // DON'T write ".gif" after gif image name
        self.loadingView.loadingImageName = "loading"
        self.loadingView.closeButtonImageName = "doggo"
        self.loadingView.delegate = self
        self.loadingView.showLoadingView(true, hasCloseBtn: true)
    }
}

// MARK: - LoadingViewDelegate
extension ViewController: EggLoadingViewDelegate {
    func pressCloseButton(_ button: UIButton) {
        print("Close Button Click")
    }
}
```

## Author

Thanavat Chaopaknam, thanavat.chao@gmail.com

## License

EggLoadingView is available under the MIT license. See the LICENSE file for more info.
