//
//  ViewController.swift
//  ProjectOnTap
//
//  Created by Алтын on 9/27/20.
//

import UIKit

extension Array where Element: Equatable {
    
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}

class ViewController: UIViewController {
    
    var x : CGFloat = 0.0
    var y : CGFloat = 0.0
    
    var viewArray = [UIView]()
    var tagArray = [Int]()
    
    var counter = 1
    
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
            x = x - 50
            y = y - 50
            myView.frame = CGRect(x: self.x, y: self.y, width: 100, height: 100)
            myView.layer.cornerRadius = 0.5 * myView.bounds.size.width
            myView.tag = self.counter
            myView.backgroundColor = self.randomColor()
            self.view.addSubview(myView)
            
            viewArray.append(myView)
            
            for i in viewArray {
                if i.frame.intersects(myView.frame) {
                    tagArray.append(myView.tag)
                    removeSubview()
                }
            }
        }
        counter = counter + 1
    }
    
    func removeSubview(){
        
        print(viewArray)
        
        for i in tagArray {
            if let viewWithTag = self.view.viewWithTag(i) {
                viewWithTag.removeFromSuperview()
            }
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

