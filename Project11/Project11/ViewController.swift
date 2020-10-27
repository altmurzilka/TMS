//
//  ViewController.swift
//  Project11
//
//  Created by Алтын on 10/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(processNotification), name: Notification.Name.buttonPressed, object: nil)
        self.registerForKeyboardNotifications()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            NotificationCenter.default.post(name: Notification.Name.buttonPressed, object: nil, userInfo: nil)
        }
    }
    
    @objc func processNotification() {
        self.label.text = "Notification!"
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        let userInfo = notification.userInfo!
        let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        if notification.name == UIResponder.keyboardWillHideNotification {
        //    bottomLayoutConstraint.constant = 0
            print("kb hide")
        } else {
       //     bottomLayoutConstraint.constant = keyboardScreenEndFrame.height
            print("kb show")
        }
        
        view.needsUpdateConstraints()
        
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    
        
//        @objc private func keyboardWillShow(_ notification: NSNotification) {
//            if bottomConstraint.constant > 0 { return }
//
//            let userInfo = notification.userInfo!
//            let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
//            let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//
//            if notification.name == UIResponder.keyboardWillHideNotification {
//                bottomConstraint.constant = 0
//            } else {
//                bottomConstraint.constant = keyboardScreenEndFrame.height
//                scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentSize.height)
//            }
//
//            view.needsUpdateConstraints()
//
//            UIView.animate(withDuration: animationDuration) {
//                self.view.layoutIfNeeded()
//            }
//        }
    
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension Notification.Name {
    static let buttonPressed = Notification.Name("buttonPressed")
}
