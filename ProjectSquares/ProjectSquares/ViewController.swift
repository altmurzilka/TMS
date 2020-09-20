//
//  ViewController.swift
//  ProjectSquares
//
//  Created by Алтын on 9/17/20.
//

import UIKit

//extension UIColor {
//    static var random: UIColor {
//        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
//    }
//}

class ViewController: UIViewController {
    
    let colors = [UIColor.red:"red", UIColor.blue:"blue", UIColor.brown:"brown", UIColor.cyan:"cyan", UIColor.gray:"gray", UIColor.green:"green", UIColor.magenta:"magenta", UIColor.orange:"orange", UIColor.purple:"purple", UIColor.yellow:"yellow", UIColor.white:"white", UIColor.darkGray:"darkGray", UIColor.lightGray:"lightGray", UIColor.systemIndigo:"indigo", UIColor.systemPink:"pink", UIColor.systemTeal:"teal"]
    
    let entireView = UIView()
    let button = UIButton()
    let stepper = UIStepper()
    let label = UILabel()
    let message = UILabel()
    
    var side: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        entireView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.entireView.addGestureRecognizer(gesture)
        
        button.frame = CGRect(x: self.view.frame.size.width - 80, y: self.view.frame.size.height - 80, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
        stepper.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height - 65, width: 60, height: 30)
        stepper.minimumValue = 50
        stepper.maximumValue = 150
        stepper.stepValue = 10
        stepper.value = 100
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        self.view.addSubview(stepper)
        
        label.frame = CGRect(x: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height - 65, width: 60, height: 30)
        self.label.text = "\(Int(self.stepper.value))"
        self.view.addSubview(label)
        
        message.frame = CGRect(x: self.view.frame.size.width / 2 - 170, y: self.view.frame.size.height - 65, width: 120, height: 30)
        self.message.text = "Set the side: "
        self.view.addSubview(message)
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        
        var originX: CGFloat = 0.0
        var originY: CGFloat = 0.0
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        let row = Int(height/side)
        let column = Int(width/side)
        
        for _ in 0..<row {
            
            for _ in 0..<column {
                
                let myView = UIView()
                let myLabel = UILabel()
                
                let oneTimeColor = colors.randomElement()
                
                let colorValue = oneTimeColor!.key
                let colorName = oneTimeColor!.value
                
                myView.frame = CGRect(x: originX, y: originY, width: side, height: side)
                myView.tag = 1
                myLabel.frame = CGRect(x: originX, y: originY, width: side, height: 20)
                myLabel.tag = 2
                myLabel.center = CGPoint(x: originX + side/2, y: originY + side/2)
                myLabel.textAlignment = .center
                
                myView.backgroundColor = colorValue
                myLabel.textColor = .black
                myLabel.text = colorName
                originX = originX + side
                
                self.view.addSubview(myView)
                self.view.addSubview(myLabel)
                
            }
            originX = 0
            originY = originY + side
        }
        
        self.view.addSubview(entireView)
        
    }
    
    @objc func stepperChanged(sender: UIStepper!) {
        self.label.text = "\(Int(stepper.value))"
        self.side = CGFloat(self.stepper.value)
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        removeSubview()
    }
    
    func removeSubview(){
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        let row = Int(height/side)
        let column = Int(width/side)
        
        for _ in 0..<row {
            for _ in 0..<column {
                if let viewWithTag = self.view.viewWithTag(1) {
                    viewWithTag.removeFromSuperview()
                    if let viewWithTag =  self.view.viewWithTag(2) {
                        viewWithTag.removeFromSuperview()
                    }
                }
            }
        }
        
        entireView.removeFromSuperview()
    }
    
}
