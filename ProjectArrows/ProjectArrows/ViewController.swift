//
//  ViewController.swift
//  ProjectArrows
//
//  Created by Алтын on 9/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    
    var step: CGFloat = 50
    
    let buttonUp = UIButton()
    let buttonDown = UIButton()
    let buttonRight = UIButton()
    let buttonLeft = UIButton()
    
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
        buttonUp.frame = CGRect(x: width / 2 - 25, y: height / 2 + 200, width: 50, height: 50)
        buttonUp.addTarget(self, action: #selector(buttonActionUp), for: .touchUpInside)
        self.view.addSubview(buttonUp)
        
        buttonDown.setImage(UIImage(systemName: "arrow.down.square", withConfiguration: configuration), for: .normal)
        buttonDown.frame = CGRect(x: width / 2 - 25, y: height / 2 + 250, width: 50, height: 50)
        buttonDown.addTarget(self, action: #selector(buttonActionDown), for: .touchUpInside)
        self.view.addSubview(buttonDown)
        
        buttonLeft.setImage(UIImage(systemName: "arrow.left.square", withConfiguration: configuration), for: .normal)
        buttonLeft.frame = CGRect(x: width / 2 - 75, y: height / 2 + 250, width: 50, height: 50)
        buttonLeft.addTarget(self, action: #selector(buttonActionLeft), for: .touchUpInside)
        self.view.addSubview(buttonLeft)
        
        buttonRight.setImage(UIImage(systemName: "arrow.right.square", withConfiguration: configuration), for: .normal)
        buttonRight.frame = CGRect(x: width / 2 + 25, y: height / 2 + 250, width: 50, height: 50)
        buttonRight.addTarget(self, action: #selector(buttonActionRight), for: .touchUpInside)
        self.view.addSubview(buttonRight)
        
    }
    
    @objc func buttonActionUp(sender: UIButton!) {
        if myView.frame.origin.y <= 10.0 {
            //   print("error")
        } else {
            myView.frame.origin.y -= step
            //  print("frame - \(myView.frame.origin.y)")
            //  print(myView.bounds.origin.y)
        }
    }
    
    @objc func buttonActionDown(sender: UIButton!) {
        let height = self.view.frame.size.height
        if myView.frame.origin.y >= height / 2 + 70 {
        } else {
            myView.frame.origin.y += step
        }
    }
    
    @objc func buttonActionLeft(sender: UIButton!) {
        if myView.frame.origin.x <= 10.0 {
        } else {
            myView.frame.origin.x -= step
        }
    }
    
    @objc func buttonActionRight(sender: UIButton!) {
        let width = self.view.frame.size.width
        if myView.frame.origin.x >= width - 110.0 {
        } else {
            myView.frame.origin.x += step
        }
    }
    
    func newColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        
    }
    
}

