//
//  ForthViewController.swift
//  Project5
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class ForthViewController: UIViewController {
    

    @IBAction func Back(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

    @IBAction func Root(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
