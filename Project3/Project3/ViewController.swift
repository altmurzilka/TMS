//
//  ViewController.swift
//  Project3
//
//  Created by Алтын on 9/8/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myLable2: UILabel!
    @IBOutlet var myLabel3: UILabel!
    @IBOutlet var myLabel4: UILabel!
    @IBOutlet var myLabel5: UILabel!
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("My")
        
        Manager.shared.ololo()
    }
    @IBAction func buttonPressed2(_ sender: UIButton) {
        print("cool")
    }
    
    @IBAction func buttonPressed3(_ sender: UIButton) {
        print("buttons")
    }
    
    @IBAction func buttonPressed4(_ sender: UIButton) {
        print("work")
    }
    
    @IBAction func buttonPressed5(_ sender: UIButton) {
        print("good")
    }
    override func viewDidLoad() {
        
        // let x = [(1, "x"), (4, "y"), (6, "a")]
        
        super.viewDidLoad()
        
        let address = Address(street: "Samal", home: 33)
        let student = Student(name: "Alt", age: 25, group: "CSSE-1608", address: address)
        
        self.myLabel.text = "My"
        self.myLable2.text = "cool"
        self.myLabel3.text = "labels"
        self.myLabel4.text = "work"
        self.myLabel5.text = "good"
        
        // print(x.map({ ($0.0 * $0.0, $0.1 ) }).filter({ $0.0 % 2 == 0 }).sorted(by: { $0.1 < $1.1 }) )
        
    }


}

