//
//  ViewController.swift
//  Project5
//
//  Created by Алтын on 9/22/20.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func changeBgColor()
}

class ViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognizer(_:)))
        self.view.addGestureRecognizer(recognizer)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDetected(_:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
    }
    
    @IBAction func Button(_ sender: UIButton) {
        self.delegate?.changeBgColor()
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        //
        //        controller.text = "OLOLO"
        //        self.present(controller, animated: true, completion: nil)
        
        //        let controller = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func tapRecognizer(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc func leftSwipeDetected(_ sender: UISwipeGestureRecognizer) {
        print("left swipe")
    }
    
}

