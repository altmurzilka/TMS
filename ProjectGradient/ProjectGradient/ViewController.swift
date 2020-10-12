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
        gradient.customView()
        view.layer.addSublayer(gradient)
    }
}

extension CAGradientLayer {
    func customView() {
        self.cornerRadius = 50.0
        self.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        self.masksToBounds = false
        self.shadowColor = UIColor.black.cgColor
        self.shadowOpacity = 1
        self.shadowOffset = .zero
        self.shadowRadius = 50
        self.shouldRasterize = true
        self.rasterizationScale = UIScreen.main.scale
    }
}
