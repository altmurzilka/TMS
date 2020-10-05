//
//  NewGameViewController.swift
//  ProjectRace
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class NewGameViewController: UIViewController {

    @IBOutlet var roadView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 4.0, delay: 0, options: [.repeat, .autoreverse, .curveLinear], animations: {
            self.roadView.frame.origin.y = self.view.bounds.height + self.roadView.frame.height - 50

        }, completion: nil)
        
    }
    
    

}
