//
//  ForthViewController.swift
//  ProjectPea
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class ForthViewController: UIViewController {
    
    var text = ""
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        controller.text = self.text
        self.present(controller, animated: true, completion: nil)
    }
    
   

}
