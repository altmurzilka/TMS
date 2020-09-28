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
    var tagsToDeleteArray = [Int]()
    
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    
    // taking the position of user's press
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            x = position.x
            y = position.y
            print("\(x) \(y)")
            isIntersects()
        }
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        
        if sender.state == .ended {
            
            
            for i in viewArray {
                if tagsToDeleteArray.count > 0 {
                    removeSubview(tag: i.tag)
                }
                tagsToDeleteArray.removeAll()
            }
            
            
            let myView = UIView()
            myView.frame = CGRect(x: self.x-50, y: self.y-50, width: 100, height: 100)
            myView.layer.cornerRadius = 0.5 * myView.bounds.size.width
            myView.tag = self.counter
            myView.backgroundColor = self.randomColor()
            viewArray.append(myView)
            self.view.addSubview(myView)
            
        }
        
        print(viewArray)
        tagArray.append(counter)
        counter = counter + 1
        
        print(tagArray)
        print(tagsToDeleteArray)
    }
    
    
    func isIntersects() {
        for i in viewArray {
            if CGFloat(x-101)...CGFloat(x+101) ~=  i.frame.origin.x {
                if CGFloat(y-101)...CGFloat(y+101) ~=  i.frame.origin.y {
                    tagsToDeleteArray.append(i.tag)
                }
            } else if CGFloat(y-101)...CGFloat(y+101) ~=  i.frame.origin.y {
                if CGFloat(x-101)...CGFloat(x+101) ~=  i.frame.origin.x {
                    tagsToDeleteArray.append(i.tag)
                }
            }
        }
    }
    
    
    func removeSubview(tag: Int) {
        for i in tagsToDeleteArray {
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

