//
//  ViewController.swift
//  ProjectBrowser
//
//  Created by Алтын on 11/3/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    @IBAction func buttonTapped() {
        let vc = SFSafariViewController(url: URL(string: "")!)
        present(vc, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
}

