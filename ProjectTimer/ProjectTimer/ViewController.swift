//
//  ViewController.swift
//  ProjectTimer
//
//  Created by Алтын on 10/3/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = CGRect(x: UIScreen.main.bounds.midX - 150, y: UIScreen.main.bounds.midY - 250, width: 300, height: 500)
        
        let squareView = UIBezierPath(rect: path)

        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = 3
        animation.repeatCount = MAXFLOAT
        animation.path = squareView.cgPath

        let circle = UIView()
        // whatever the value of origin for squareView will not affect the animation
        circle.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        circle.layer.cornerRadius = circle.frame.size.width/2
        circle.backgroundColor = .lightGray
        view.addSubview(circle)
        // You can also pass any unique string value for key
        circle.layer.add(animation, forKey: nil)

        // circleLayer is only used to locate the circle animation path
        let circleLayer = CAShapeLayer()
        circleLayer.path = squareView.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(circleLayer)
    }
    
}


