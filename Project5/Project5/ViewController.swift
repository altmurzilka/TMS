//
//  ViewController.swift
//  Project5
//
//  Created by Алтын on 9/22/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Button(_ sender: UIButton) {
//        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//
//        controller.text = "OLOLO"
//        self.present(controller, animated: true, completion: nil)
        
        let controller = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
//                controller.text = "OLOLO"
//                self.present(controller, animated: true, completion: nil)
    }
    
}

