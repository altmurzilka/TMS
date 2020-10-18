//
//  ViewController.swift
//  ProjectBurgerMenu
//
//  Created by Алтын on 10/17/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var menuView: UIView!
    @IBOutlet var blurView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        blurView.addGestureRecognizer(tap)
        
        blurAddition()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.blurView.isHidden = false
            self.menuView.frame.origin.x = 0
        })
    }
    
    func blurAddition() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.addSubview(blurEffectView)
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        anonimation()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        anonimation()
    }
    
    func anonimation() {
        UIView.animate(withDuration: 1, animations: {
            self.blurView.isHidden = true
            self.menuView.frame.origin.x = -150
        })
    }
}

