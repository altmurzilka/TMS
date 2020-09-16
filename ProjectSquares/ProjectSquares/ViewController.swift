//
//  ViewController.swift
//  ProjectSquares
//
//  Created by Алтын on 9/17/20.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}

class ViewController: UIViewController {
    
    let side: CGFloat = 75
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: self.view.frame.size.width - 80, y: self.view.frame.size.height - 80, width: 70, height: 70)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        
        var originX: CGFloat = 0.0
        var originY: CGFloat = 0.0
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        print(width)
        print(height)
        
        let row = Int(height/side)
        print("Row - \(row)")
        let column = Int(width/side)
        print("Column - \(column)")
        
        for _ in 0..<row {
            
            for _ in 0..<column {
                
                let myView = UIView()
                myView.frame = CGRect(x: originX, y: originY, width: side, height: side)
                myView.backgroundColor = .random
                originX = originX + side
                self.view.addSubview(myView)
                
            }
            originX = 0
            originY = originY + side
            
        }
        
    }
    
}

