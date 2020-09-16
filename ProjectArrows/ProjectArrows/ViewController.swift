//
//  ViewController.swift
//  ProjectArrows
//
//  Created by Алтын on 9/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    var num: Int = 1
    
    let buttonUp = UIButton()
    let buttonDown = UIButton()
    let buttonRight = UIButton()
    let buttonLeft = UIButton()
    
    var toUp = false
    
    let configuration = UIImage.SymbolConfiguration(pointSize: 100)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        myView.frame = CGRect(x: width / 2 - 50, y: height / 2 - 200, width: 100, height: 100)
        myView.layer.cornerRadius = 0.5 * myView.bounds.size.width
        myView.backgroundColor = newColor()
        self.view.addSubview(myView)
        
        buttonUp.setImage(UIImage(systemName: "arrow.up.square", withConfiguration: configuration), for: .normal)
        buttonUp.frame = CGRect(x: self.view.frame.size.width / 2 - 25, y: self.view.frame.size.height / 2 + 200, width: 50, height: 50)
        buttonUp.addTarget(self, action: #selector(buttonActionUp), for: .touchUpInside)
        num = 1
        self.view.addSubview(buttonUp)
        
        buttonDown.setImage(UIImage(systemName: "arrow.down.square", withConfiguration: configuration), for: .normal)
        buttonDown.frame = CGRect(x: self.view.frame.size.width / 2 - 25, y: self.view.frame.size.height / 2 + 250, width: 50, height: 50)
        buttonDown.addTarget(self, action: #selector(buttonActionDown), for: .touchUpInside)
        num = 2
        self.view.addSubview(buttonDown)
        
        buttonLeft.setImage(UIImage(systemName: "arrow.left.square", withConfiguration: configuration), for: .normal)
        buttonLeft.frame = CGRect(x: self.view.frame.size.width / 2 - 75, y: self.view.frame.size.height / 2 + 250, width: 50, height: 50)
        buttonLeft.addTarget(self, action: #selector(buttonActionLeft), for: .touchUpInside)
        num = 3
        self.view.addSubview(buttonLeft)
        
        buttonRight.setImage(UIImage(systemName: "arrow.right.square", withConfiguration: configuration), for: .normal)
        buttonRight.frame = CGRect(x: self.view.frame.size.width / 2 + 25, y: self.view.frame.size.height / 2 + 250, width: 50, height: 50)
        buttonRight.addTarget(self, action: #selector(buttonActionRight), for: .touchUpInside)
        num = 4
        self.view.addSubview(buttonRight)
        
    }
    
    @objc func buttonActionUp(sender: UIButton!) {
        toUp = true
        
        let width = myView.frame.size.width / 2 - 50
        var height = myView.frame.size.height / 2 - 200
        
        if self.toUp == true && height != self.view.frame.size.width - 50 {
            height -= 2
            myView.frame = CGRect(x: width, y: height, width: 100, height: 100)
        }
        self.toUp = !self.toUp
    }
    
    @objc func buttonActionDown(sender: UIButton!) {
        
    }
    
    @objc func buttonActionLeft(sender: UIButton!) {
        
        
    }
    
    @objc func buttonActionRight(sender: UIButton!) {
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
    }
    
    func newColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        
    }
    
}

