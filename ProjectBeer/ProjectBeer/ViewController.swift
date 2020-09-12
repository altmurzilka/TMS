//
//  ViewController.swift
//  ProjectBeer
//
//  Created by Алтын on 9/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    var beer1 = Beer(label: "Hobgoblin", price: 2800, country: "England", quantity: 100)
    var beer2 = Beer(label: "Fuller's", price: 3000, country: "England", quantity: 100)
    var beer3 = Beer(label: "Hacker-Pschorr", price: 3200, country: "Germany", quantity: 100)
    
    @IBOutlet var myStepper1: UIStepper!
    @IBOutlet var myStepper2: UIStepper!
    @IBOutlet var myStepper3: UIStepper!
    
    var total1: Int = 0
    var total2: Int = 0
    var total3: Int = 0
    
    var b1: Int = 0
    var b2: Int = 0
    var b3: Int = 0
    
    @IBOutlet var counter1: UILabel!
    @IBOutlet var counter2: UILabel!
    @IBOutlet var counter3: UILabel!
    
    @IBAction func stepper1(_ sender: UIStepper) {
        self.counter1.text = String(Int(sender.value))
        b1 = Manager.shared.beer(quantity: Int(sender.value))
        total1 = beer1.price * Manager.shared.beer(quantity: Int(sender.value))
    }
    
    @IBAction func stepper2(_ sender: UIStepper) {
        self.counter2.text = String(Int(sender.value))
        b2 = Manager.shared.beer(quantity: Int(sender.value))
        total2 = beer2.price * Manager.shared.beer(quantity: Int(sender.value))
    }
    
    @IBAction func stepper3(_ sender: UIStepper) {
        self.counter3.text = String(Int(sender.value))
        b3 = Manager.shared.beer(quantity: Int(sender.value))
        total3 = beer3.price * Manager.shared.beer(quantity: Int(sender.value))
    }
    
    @IBAction func totalSum(_ sender: UIButton) {
        
        let message = Manager.shared.sell(total1: self.total1, total2: self.total2, total3: self.total3)
        
        let alert = UIAlertController(title: "Total sum:", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Pay", style: .default) { action in
            self.myStepper1.value = 0
            self.myStepper2.value = 0
            self.myStepper3.value = 0
            self.total1 = 0
            self.total2 = 0
            self.total3 = 0
            self.counter1.text = String(0)
            self.counter2.text = String(0)
            self.counter3.text = String(0)
            self.beer1.quantity = self.beer1.quantity - self.b1
            self.beer2.quantity = self.beer2.quantity - self.b2
            self.beer3.quantity = self.beer3.quantity - self.b3
            print(message)
        }
        
        alert .addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func leftovers(_ sender: UIButton) {
        
        let message = Manager.shared.newShift(beer1: self.b1, beer2: self.b2, beer3: self.b3)
        
        let alert = UIAlertController(title: "Remnants:", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            self.beer1.quantity = self.beer1.quantity - self.b1
            self.beer2.quantity = self.beer2.quantity - self.b2
            self.beer3.quantity = self.beer3.quantity - self.b3
            print(message)
        }
        
        alert .addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func renewLeftovers(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Shift Ended!", message: "Time to go home!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Understood", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert .addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func startNewRound() {
        myStepper1.value = 0
        myStepper2.value = 0
        myStepper3.value = 0
        total1 = 0
        total2 = 0
        total3 = 0
        b1 = 0
        b2 = 0
        b3 = 0
        counter1.text = String(0)
        counter2.text = String(0)
        counter3.text = String(0)
    }
    
    
    
}

