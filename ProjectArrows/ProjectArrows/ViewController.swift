//
//  ViewController.swift
//  ProjectArrows
//
//  Created by Алтын on 9/16/20.
//

import UIKit

enum Direction {
    case up
    case down
    case left
    case right
}

class ViewController: UIViewController {
    
    let myView = UIView()
    let myLabel = UILabel()
    
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
        
        myLabel.frame = CGRect(x: width/2, y: height/2 - 300, width: 200, height: 21)
        myLabel.center = CGPoint(x: width/2, y: height/2 - 250)
        myLabel.textAlignment = .center
        myLabel.text = ""
        self.view.addSubview(myLabel)
        
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
        if !self.canMove(direction: .up) {
            myLabel.textColor = .red
            myLabel.text = "Error. Can't move up."
        } else {
            self.moveCircel(direction: .up)
        }
    }
    
    @objc func buttonActionDown(sender: UIButton!) {
        if !self.canMove(direction: .down) {
            myLabel.textColor = .red
            myLabel.text = "Error. Can't move down."
        } else {
            self.moveCircel(direction: .down)
        }
    }
    
    @objc func buttonActionLeft(sender: UIButton!) {
        if !self.canMove(direction: .left) {
            myLabel.textColor = .red
            myLabel.text = "Error. Can't move left."
        } else {
            self.moveCircel(direction: .left)
        }
    }
    
    @objc func buttonActionRight(sender: UIButton!) {
        if !self.canMove(direction: .right) {
            myLabel.textColor = .red
            myLabel.text = "Error. Can't move right."
        } else {
            self.moveCircel(direction: .right)
        }
    }
    
    func moveCircel(direction: Direction) {
        switch direction {
        case .up:
            myView.frame.origin.y -= step
            myLabel.textColor = .black
            myLabel.text = "UP"
        case .down:
            myView.frame.origin.y += step
            myLabel.textColor = .black
            myLabel.text = "DOWN"
        case .left:
            myView.frame.origin.x -= step
            myLabel.textColor = .black
            myLabel.text = "LEFT"
        case .right:
            myView.frame.origin.x += step
            myLabel.textColor = .black
            myLabel.text = "RIGHT"
        }
    }
    
    func canMove(direction: Direction) -> Bool {
        switch direction {
        case .up:
            if myView.frame.origin.y <= 32.0 {
                return false
            }
        case .down:
            let height = self.view.frame.size.height
            if myView.frame.origin.y >= height / 2 + 70 {
                return false
            }
        case .left:
            if myView.frame.origin.x <= 10.0 {
                return false
            }
        case .right:
            let width = self.view.frame.size.width
            if myView.frame.origin.x >= width - 110.0 {
                return false
            }
        }
        return true
    }
    
    func newColor() -> UIColor {
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        
    }
    
}

