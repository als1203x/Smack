//
//  GradientView.swift
//  Smack
//
//  Created by LinuxPlus on 1/8/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

        //create custom properties, change in StoryBoard dynamically
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet  {
                // triggers layout update of view
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor : UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1)  {
        didSet  {
            self.setNeedsLayout()
        }
    }
        //is called by setNeedsLayout()
    override func layoutSubviews() {
            //create layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        
            //start and end point   -- (0,0) (1,0)(0,1)(1,1)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
            //tell what size view is
        gradientLayer.frame = self.bounds
            //inserts specified layer in UIView
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
