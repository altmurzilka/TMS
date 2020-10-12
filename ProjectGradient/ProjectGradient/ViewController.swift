//
//  ViewController.swift
//  ProjectGradient
//
//  Created by Алтын on 10/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        gradient.frame = CGRect(x: width / 2 - 50, y: height / 2 - 50, width: 100, height: 100)
        gradient.cornerRadius = 50.0
        gradient.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        gradient.masksToBounds = false
        gradient.shadowColor = UIColor.black.cgColor
        gradient.shadowOpacity = 1
        gradient.shadowOffset = .zero
        gradient.shadowRadius = 50
        gradient.shouldRasterize = true
        gradient.rasterizationScale = UIScreen.main.scale
        view.layer.addSublayer(gradient)
    }
}
