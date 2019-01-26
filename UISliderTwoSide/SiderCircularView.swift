//
//  SiderCircularView.swift
//  UISliderTwoSide
//
//  Created by Farhad Faramarzi on 1/26/19.
//  Copyright © 2019 Farhad. All rights reserved.
//

import UIKit

class SiderCircularView: UIView {
    
    let circle = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        addSubview(circle)
        backgroundColor = .clear
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        
        circle.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        circle.layer.borderWidth = 1
        circle.backgroundColor = .white
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        circle.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        circle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        circle.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        circle.layer.cornerRadius = self.frame.width / 2
    }
}
