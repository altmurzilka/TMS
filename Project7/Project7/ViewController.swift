//
//  ViewController.swift
//  Project7
//
//  Created by Алтын on 10/1/20.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        squareView.backgroundColor = .green
        squareView.addGradient()
        squareView.dropShadow()
        
        self.view.addSubview(squareView)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //        UIView.animate(withDuration: 1) {
        //            self.squareView.frame.origin.y += 100
        //        } completion: { (_) in
        //            print("lol")
        //        }
        
        //        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
        //                    self.topViewConstraint.constant += 50
        //                    UIView.animate(withDuration: 1) {
        //                        self.view.layoutIfNeeded()
        //                    }
        //                    self.counter += 1
        //
        //                    if self.counter == 5 {
        //                        timer.invalidate()
        //                    }
        //                }
        //                timer.fire()
        
        
    }
    
    
    
}


extension UIView {
    
    
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 10
        
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        
    }
    
    func addGradient() {
        
        self.layer.cornerRadius = CGFloat(20)
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradient.opacity = 0.6
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = self.bounds
        self.layer.addSublayer(gradient)
        
        
    }
    
    func roundCorners(_ radius: Int = 20) {
        self.layer.cornerRadius = CGFloat(radius)
    }
}
