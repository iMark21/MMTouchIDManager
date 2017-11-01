# MMTouchIDManager

`MMTouchIDManager` provides an easy way to manage TouchID hardware.

[![CI Status](http://img.shields.io/travis/iMark21/MMTouchIDManager.svg?style=flat)](https://travis-ci.org/iMark21/MMTouchIDManager)
[![Version](https://img.shields.io/cocoapods/v/MMTouchIDManager.svg?style=flat)](http://cocoapods.org/pods/MMTouchIDManager)
[![License](https://img.shields.io/cocoapods/l/MMTouchIDManager.svg?style=flat)](http://cocoapods.org/pods/MMTouchIDManager)
[![Platform](https://img.shields.io/cocoapods/p/MMTouchIDManager.svg?style=flat)](http://cocoapods.org/pods/MMTouchIDManager)

## Requirements

- iOS 8 
- ARC

## Installation

MMTouchIDManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MMTouchIDManager'
```

and to show the Touch ID Dialog with your custom message, just add this line:

```objc

[[MMTouchIDManager sharedInstance] presentTouchIdDialogIfNeededWithMessage:@"Do you want to access with to the BEST APP in the world with your Touch id?" andCompletion:^(BOOL accessEnabled) {
    if (accessEnabled) {
       [self showAlertWithMessage:@"Congratulations!!! Your are in!" withRetry:false];      
    }else{
       [self showAlertWithMessage:@"Ooops, your are not in!" withRetry:true];
    }
}];
    
```
## Author

iMark21, marques.jm@icloud.com

## License

MMTouchIDManager is available under the MIT license. See the LICENSE file for more info.
