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
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
//        let blurVC = BlurVC()
//        // Tell Swift we going custom now!
//        blurVC.modalPresentationStyle = .custom
//        // Present the blurVC
//        present(blurVC, animated: true, completion: nil)
        
        UIView.animate(withDuration: 1, animations: {
            self.blurView.isHidden = false
            self.menuView.frame.origin.x = 0
        })
    }
    
    func setBlurView() {
        let blurView = UIVisualEffectView()
        blurView.frame = view.frame
        blurView.effect = UIBlurEffect(style: .regular)
        view.addSubview(blurView)
    }
    
}

