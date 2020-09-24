//
//  SecondViewController.swift
//  ProjectCustomClass
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private var labelName: UILabel!
    @IBOutlet private var labelFilling: UILabel!
    @IBOutlet var labelTopping: UILabel!
    
    var name = ""
    var filling = ""
    var topping = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.labelName.text = name
        self.labelFilling.text = "\(filling) filling"
        self.labelTopping.text = "with \(topping) topping"
    }
    

    @IBAction func buttonHide(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
