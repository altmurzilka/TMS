//
//  Extensions.swift
//  ProjectRace
//
//  Created by Алтын on 10/12/20.
//

import UIKit

extension UIButton {
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func customColor() {
        self.clipsToBounds = true
        self.tintColor = .red
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
}
