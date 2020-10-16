//
//  ViewController.swift
//  ProjectAlert
//
//  Created by Алтын on 10/16/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLable: UILabel!
    
    func promptForAnswer() {
        let alertController = UIAlertController(title: "Add your password", message: "", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) in
            textField.placeholder = "Enter password"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { alert in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            firstTextField.isSecureTextEntry = true
            secondTextField.isSecureTextEntry = true
            
            if firstTextField == secondTextField {
                self.myLable.text = "Password added"
            } else {
                self.myLable.text = "Password doesn't match"
            }
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Confirm password"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        promptForAnswer()
    }
}

