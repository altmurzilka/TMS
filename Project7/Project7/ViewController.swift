//
//  ViewController.swift
//  Project7
//
//  Created by Алтын on 10/1/20.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        squareView.backgroundColor = .green
        self.view.addSubview(squareView)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
//        UIView.animate(withDuration: 1) {
//            self.squareView.frame.origin.y += 100
//        } completion: { (_) in
//            print("lol")
//        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                    self.topViewConstraint.constant += 50
                    UIView.animate(withDuration: 1) {
                        self.view.layoutIfNeeded()
                    }
                    self.counter += 1
                    
                    if self.counter == 5 {
                        timer.invalidate()
                    }
                }
                timer.fire()

    }
    
}

