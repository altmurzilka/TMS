//
//  ViewController.swift
//  ProjectCat
//
//  Created by Алтын on 9/16/20.
//

import UIKit

//extension UIColor {
//    static var random: UIColor {
//        return UIColor(red: .random(in: 0...1),
//                       green: .random(in: 0...1),
//                       blue: .random(in: 0...1),
//                       alpha: 1.0)
//    }
//}

class ViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height / 2 - 50, width: 100, height: 100)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = newColor()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        button.frame = CGRect(x: Int.random(in: 1...(Int(self.view.frame.size.width) - 100)), y: Int.random(in: 1...(Int(self.view.frame.size.height)) - 100), width: 100, height: 100)
        button.backgroundColor = newColor()
    }
    
    
    func newColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        
    }
    
}

