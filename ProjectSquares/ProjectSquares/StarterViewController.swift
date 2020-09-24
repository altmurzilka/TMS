//
//  StarterViewController.swift
//  ProjectSquares
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class StarterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(controller, animated: true, completion: nil)
    }

}
