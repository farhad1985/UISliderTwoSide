//
//  ViewController.swift
//  Example
//
//  Created by Farhad Faramarzi on 1/24/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

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

