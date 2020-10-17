//
//  ViewController.swift
//  ProjectAlert
//
//  Created by Алтын on 10/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLable: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        promptForAnswer()
    }
    
    func promptForAnswer() {
        
        let myAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor : UIColor.black,
                                                          NSAttributedString.Key.font : UIFont(name: "ThisNight", size: 25.0)!]
        
        let alertController = UIAlertController(title: "Add your password", message: "", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) in
            textField.placeholder = "Enter password"
            textField.isSecureTextEntry = true
        }

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            if firstTextField.text!.isEmpty || secondTextField.text!.isEmpty {
                
                self.myLable.attributedText = NSAttributedString(string: "Field are empty", attributes: myAttribute)
                
            } else if firstTextField.text == secondTextField.text {
                
                self.myLable.attributedText = NSAttributedString(string: "Password added!", attributes: myAttribute)
                
            } else {
                
                self.myLable.attributedText = NSAttributedString(string: "Password doesn't match", attributes: myAttribute)
                
            }
        })
        
        alertController.addTextField { (textField : UITextField!) in
            textField.placeholder = "Confirm password"
            textField.isSecureTextEntry = true
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

