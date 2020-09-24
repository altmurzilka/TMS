//
//  ThirdViewController.swift
//  Project5
//
//  Created by Алтын on 9/22/20.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func Back(_ sender: UIButton) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func Forward(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ForthViewController") as! ForthViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    @IBAction func Root(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
