//
//  ViewController.swift
//  Project7
//
//  Created by Алтын on 10/1/20.
//

import UIKit

class ViewController: UIViewController {
    
    //    lazy var squareView = UIView()
    
    @IBOutlet var myLabel: UILabel!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var blurScreen: UIVisualEffectView!
    
    var viz = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurScreen.isHidden = true
        
        let someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        for (k, v) in someDict {
            print("\(k) - \(v)")
        }
        print(someDict[5])
        
        
        let font = UIFont(name: "GreatVibes-Regular", size: 40)
        self.label.font = font
        
        let myString = "Swift"
        
        let addedString = " Attributed String"
        
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: 3, height: 3)
        myShadow.shadowColor = UIColor.gray
        
        let myAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.blue,
                                                          NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                          NSAttributedString.Key.shadow: myShadow]
        let myAttrString = NSMutableAttributedString(string: myString, attributes: myAttribute)
        
        let myAddedAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.green, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.double.rawValue]
        
        let myAddedAttributeString = NSAttributedString(string: addedString, attributes: myAddedAttribute)
        
        myAttrString.append(myAddedAttributeString)
        
        self.myLabel.attributedText = myAttrString
        //        squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        //        squareView.backgroundColor = .green
        //        squareView.addGradient()
        //        squareView.dropShadow()
        //
        //        self.view.addSubview(squareView)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        viz.toggle()
        blurScreen.isHidden = viz
        
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        let destroyAction = UIAlertAction(title: "Destroy", style: .destructive, handler: nil)
        let canselAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            print("LOLOLOLO")
        }
        alert.addAction(action)
        alert.addAction(canselAction)
        alert.addAction(destroyAction)
        self.present(alert, animated: true, completion: nil)
        //                UIView.animate(withDuration: 1) {
        //                    self.squareView.frame.origin.y += 100
        //                } completion: { (_) in
        //                    print("lol")
        //                }
        //
        //                let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
        //                            self.topViewConstraint.constant += 50
        //                            UIView.animate(withDuration: 1) {
        //                                self.view.layoutIfNeeded()
        //                            }
        //                            self.counter += 1
        //
        //                            if self.counter == 5 {
        //                                timer.invalidate()
        //                            }
        //                        }
        //                        timer.fire()
        
        
    }
    
    
    
}


extension UIView {
    
    
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 10
        
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        
    }
    
    func addGradient() {
        
        self.layer.cornerRadius = CGFloat(20)
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradient.opacity = 0.6
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = self.bounds
        self.layer.addSublayer(gradient)
        
        
    }
    
    func roundCorners(_ radius: Int = 20) {
        self.layer.cornerRadius = CGFloat(radius)
    }
}
