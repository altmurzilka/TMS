//
//  ViewController.swift
//  ProjectOnTap
//
//  Created by Алтын on 9/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    var x : CGFloat = 0.0
    var y : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            x = position.x
            y = position.y
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        
        if sender.state == .ended {
            let myView = UIView()
            myView.frame = CGRect(x: self.x - 50, y: self.y - 50, width: 100, height: 100)
            myView.layer.cornerRadius = 0.5 * myView.bounds.size.width
            myView.backgroundColor = self.randomColor()
            self.view.addSubview(myView)
        }
    }
    
    
    
    
}


//MARK: - extensions
private extension ViewController {
    func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255
        let green = CGFloat(arc4random_uniform(256)) / 255
        let blue = CGFloat(arc4random_uniform(256)) / 255
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}

