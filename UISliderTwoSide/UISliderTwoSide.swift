//
//  UISliderTwoSide.swift
//  UISliderTwoSide
//
//  Created by Farhad Faramarzi on 1/24/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import UIKit

public protocol UISliderTwoSideDelegate {
    func sliderTwoSide(slider: UISliderTwoSide, minValue: CGFloat, maxValue: CGFloat)
}

@IBDesignable
public class UISliderTwoSide: UIView {
    
    @IBInspectable var tint: UIColor = UIColor.lightGray {
        didSet {
            line.backgroundColor = tint
        }
    }
    public var minValue: CGFloat = 0
    public var maxValue: CGFloat = 1
    public var delegate: UISliderTwoSideDelegate?
    
    private let line = UIView()
    private let circle1 = SiderCircularView()
    private let circle2 = SiderCircularView()
    
    private var isActiveLeftSide = false
    private var widthLeft: CGFloat = 0
    private var widthRight: CGFloat = 0
    private var width: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
        addSubview(line)
        addSubview(circle1)
        addSubview(circle2)
        
        let tap1 = UIPanGestureRecognizer(target: self, action: #selector(touchLeftSlider))
        let tap2 = UIPanGestureRecognizer(target: self, action: #selector(touchRightSlider))
        
        circle1.addGestureRecognizer(tap1)
        circle2.addGestureRecognizer(tap2)
        line.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    }
    
    @objc
    private func touchLeftSlider(gestureRecognizer: UIPanGestureRecognizer) {
        circle2.sendSubviewToBack(circle1)
        if gestureRecognizer.state == UIGestureRecognizer.State.ended {
            if gestureRecognizer.view!.center.x < 15 {
                gestureRecognizer.view!.center = CGPoint(x: 15, y: gestureRecognizer.view!.center.y)
            }
        } else if gestureRecognizer.state == UIGestureRecognizer.State.began || gestureRecognizer.state == UIGestureRecognizer.State.changed {
            
            if gestureRecognizer.view!.center.x < 15 {
                gestureRecognizer.view!.center = CGPoint(x: 15, y: gestureRecognizer.view!.center.y)
            }

            DispatchQueue.main.async {
                UIView.transition(with: self.circle1,
                                  duration: 0.2,
                                  options: .showHideTransitionViews,
                                  animations: {
                                    if(gestureRecognizer.view!.center.x <= self.widthRight) {
                                        let translation = gestureRecognizer.translation(in: self.circle1)
                                        gestureRecognizer.view!.center =  CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y )
                                    } else {
                                        gestureRecognizer.view!.center = CGPoint(x: self.widthRight, y: gestureRecognizer.view!.center.y)
                                    }
                                    
                                    gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.circle1)
                })
                
                self.widthLeft = gestureRecognizer.view!.center.x
                self.minValue = gestureRecognizer.view!.center.x / self.width
                if self.minValue <= 0 {
                    self.minValue = 0
                }
                self.delegate?.sliderTwoSide(slider: self, minValue: self.minValue, maxValue: self.maxValue)
            }
        }
    }
    
    @objc
    private func touchRightSlider(gestureRecognizer: UIPanGestureRecognizer) {
        circle1.sendSubviewToBack(circle2)
        if gestureRecognizer.state == UIGestureRecognizer.State.ended {
            if gestureRecognizer.view!.center.x > self.width - 15  {
                gestureRecognizer.view!.center = CGPoint(x: self.width - 15 , y: gestureRecognizer.view!.center.y)
            }
        } else if gestureRecognizer.state == UIGestureRecognizer.State.began ||
            gestureRecognizer.state == UIGestureRecognizer.State.changed {
            
            if gestureRecognizer.view!.center.x > self.width - 15 {
                gestureRecognizer.view!.center = CGPoint(x: self.width - 15, y: gestureRecognizer.view!.center.y)
                return
            }
            DispatchQueue.main.async {
                UIView.transition(with: self.circle1,
                                  duration: 0.2,
                                  options: .showHideTransitionViews,
                                  animations: {
                                    
                                    if(gestureRecognizer.view!.center.x >= self.widthLeft) {
                                        let translation = gestureRecognizer.translation(in: self)
                                        gestureRecognizer.view!.center =  CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y )
                                    } else {
                                        gestureRecognizer.view!.center = CGPoint(x: self.widthLeft, y: gestureRecognizer.view!.center.y)
                                    }
                })
                self.widthRight = gestureRecognizer.view!.center.x
                gestureRecognizer.setTranslation(CGPoint(x: 0,y: 0), in: self)
                self.maxValue = gestureRecognizer.view!.center.x / (self.width - 15)
                
                if self.maxValue >= 1 {
                    self.maxValue = 1
                }
                
                self.delegate?.sliderTwoSide(slider: self, minValue: self.minValue, maxValue: self.maxValue)
            }
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        width = self.frame.width
        
        line.translatesAutoresizingMaskIntoConstraints = false
        circle1.translatesAutoresizingMaskIntoConstraints = false
        circle2.translatesAutoresizingMaskIntoConstraints = false
        
        line.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        line.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        line.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        line.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        circle1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        circle2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        circle1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        circle1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        circle1.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        circle2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        circle2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        circle2.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        widthLeft = 0
        widthRight = width
    }
    
}
