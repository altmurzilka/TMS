//
//  ViewController.swift
//  TestProject
//
//  Created by Алтын on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

    var button = UIButton()
    
    var x : CGFloat = 0.0
    var y : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: self.x - 50, y: self.y - 50, width: 100, height: 100)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = .green
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            x = position.x
            y = position.y
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let testView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
        testView.backgroundColor = .blue
        testView.tag = 100
        testView.isUserInteractionEnabled = true
        self.view.addSubview(testView)
        
        let aSelector : Selector = #selector(removeSubview)
        let tapGesture = UITapGestureRecognizer(target:self, action: aSelector)
        testView.addGestureRecognizer(tapGesture)
    }
    
    @objc func removeSubview(){
        print("Start remove sibview")
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
}

