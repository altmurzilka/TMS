//
//  FifthViewController.swift
//  ProjectPea
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet private var myLabel: UILabel!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myLabel.text = text
    }
    

}
