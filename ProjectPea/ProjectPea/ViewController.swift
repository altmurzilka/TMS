//
//  ViewController.swift
//  ProjectPea
//
//  Created by Алтын on 9/23/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        controller.text = "Oh Hi Mark"
        
        self.present(controller, animated: true, completion: nil)
    }
    
}

