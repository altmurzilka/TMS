//
//  ViewController.swift
//  ProjectAlertExtension
//
//  Created by Алтын on 10/17/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: view.center.x - 50, y: view.center.y - 25, width: 100, height: 50))
        button.backgroundColor = .red
        button.setTitle("Press Me", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        showAlert(alertText: "Wake up, Samurai...", alertMessage: "We have a city to burn.")
    }
    
}



extension UIViewController {
    
    func showAlert(alertText : String, alertMessage : String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
