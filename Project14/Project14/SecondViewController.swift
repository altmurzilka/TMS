//
//  SecondViewController.swift
//  Project14
//
//  Created by Алтын on 11/3/20.
//

import UIKit

protocol SecondViewControllerDelagate: AnyObject {
    func changeBgColor(_ cell: SecondViewController, didChange text: String)
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelagate?

    @IBOutlet var myTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonBack(_ sender: UIButton) {
        delegate?.changeBgColor(self, didChange: myTxtField.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    

}



