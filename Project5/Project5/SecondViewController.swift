//
//  SecondViewController.swift
//  Project5
//
//  Created by Алтын on 9/22/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private var textLabel: UILabel!
    
    var text = "" 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textLabel.text = text
    }
    
    
    @IBAction func SecondViewButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SecondButton(_ sender: UIButton) {
        let controller = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
