//
//  ViewController.swift
//  ProjectCat
//
//  Created by Алтын on 9/16/20.
//

import UIKit


class ViewController: UIViewController {
    
    //MARK: - let
    let button = UIButton()
    
    //MARK: - lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height / 2 - 50, width: 100, height: 100)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = newColor()
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    //MARK: - flow func
    @objc func buttonAction(sender: UIButton!) {
        button.frame = CGRect(x: Int.random(in: 1...(Int(self.view.frame.size.width) - 100)), y: Int.random(in: 1...(Int(self.view.frame.size.height)) - 100), width: 100, height: 100)
        button.backgroundColor = newColor()
    }
    
}


//MARK: - extensions
private extension ViewController {
    func newColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        
    }
}
