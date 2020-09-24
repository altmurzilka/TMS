//
//  SecondViewController.swift
//  ProjectPea
//
//  Created by Алтын on 9/23/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    var text = ""
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        controller.text = self.text
        
        self.present(controller, animated: true, completion: nil)
    }
    
}
