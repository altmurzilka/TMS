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
    
    var step: CGFloat = 80
    
    let configuration = UIImage.SymbolConfiguration(pointSize: 100)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        myView.frame = CGRect(x: width / 2 - 50, y: height / 2 - 50, width: 100, height: 100)
        myView.layer.cornerRadius = 0.5 * myView.bounds.size.width
        myView.backgroundColor = newColor()
        self.view.addSubview(myView)
        
        myLabel.frame = CGRect(x: width/2, y: height/2 - 300, width: 200, height: 21)
        myLabel.center = CGPoint(x: width/2, y: height/2 - 250)
        myLabel.textAlignment = .center
        myLabel.text = ""
        self.view.addSubview(myLabel)
        
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .right {
            if !self.canMove(direction: .right) {
                myLabel.textColor = .red
                myLabel.text = "Error. Can't move right."
            } else {
                self.moveCircel(direction: .right)
            }
        }
        else if gesture.direction == .left {
            if !self.canMove(direction: .left) {
                myLabel.textColor = .red
                myLabel.text = "Error. Can't move left."
            } else {
                self.moveCircel(direction: .left)
            }
        }
        else if gesture.direction == .up {
            if !self.canMove(direction: .up) {
                myLabel.textColor = .red
                myLabel.text = "Error. Can't move up."
            } else {
                self.moveCircel(direction: .up)
            }
        }
        else if gesture.direction == .down {
            if !self.canMove(direction: .down) {
                myLabel.textColor = .red
                myLabel.text = "Error. Can't move down."
            } else {
                self.moveCircel(direction: .down)
            }
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
            if myView.frame.origin.y <= 82.0 {
                return false
            }
        case .down:
            let height = self.view.frame.size.height
            if myView.frame.origin.y >= height - 150.0 {
                return false
            }
        case .left:
            if myView.frame.origin.x <= 10.0 {
                return false
            }
        case .right:
            let width = self.view.frame.size.width
            if myView.frame.origin.x >= width - 150.0{
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

