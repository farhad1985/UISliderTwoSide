# UISliderTwoSide
 UISliderTwoSide written in Swift
 

## Screenshot

<img src="https://github.com/farhad1985/UISliderTwoSide/blob/master/Screenshot/pic.png" width = "400" />

now you can use of UISliderTwoSide in your project


## Install
you can use of cocoapods

```
pod 'UISliderTwoSide'
```

## How to use

```swift
import UIKit
import UISliderTwoSide

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISliderTwoSide! {
        didSet {
            slider.layer.masksToBounds = true
            slider.delegate = self
        }
    }
}

extension ViewController: UISliderTwoSideDelegate {
    func sliderTwoSide(slider: UISliderTwoSide, minValue: CGFloat, maxValue: CGFloat) {
        print("min: \(minValue)  |  max: \(maxValue)")
    }
}
```
