//
//  ViewController.swift
//  ProjectTap
//
//  Created by Алтын on 9/25/20.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myPanGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        myView.addGestureRecognizer(myPanGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        myView.frame = CGRect(x: width / 2 - 50, y: height / 2 - 200, width: 100, height: 100)
        myView.layer.cornerRadius = 0.5 * myView.bounds.size.width
        myView.backgroundColor = randomColor()
        self.view.addSubview(myView)
        
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: sender.view)
            let changeX = (sender.view?.center.x)! + translation.x
            let changeY = sender.view!.center.y + translation.y
            
            sender.view!.center = CGPoint(x: changeX, y: changeY)
            sender.setTranslation(CGPoint.zero, in: sender.view)
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
