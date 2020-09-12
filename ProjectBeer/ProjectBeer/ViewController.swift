//
//  ViewController.swift
//  ProjectBeer
//
//  Created by Алтын on 9/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var myStepper1: UIStepper!
    @IBOutlet var myStepper2: UIStepper!
    @IBOutlet var myStepper3: UIStepper!
    
    @IBOutlet var counter1: UILabel!
    @IBOutlet var counter2: UILabel!
    @IBOutlet var counter3: UILabel!
    
    
    @IBAction func stepper1(_ sender: UIStepper) {
        self.counter1.text = String(Int(sender.value))
    }
    
    @IBAction func stepper2(_ sender: UIStepper) {
        self.counter2.text = String(Int(sender.value))
    }
    
    @IBAction func stepper3(_ sender: UIStepper) {
        self.counter3.text = String(Int(sender.value))
    }
    
    
    // Проверка выручки в конце дня || Продажа
    @IBAction func totalSum(_ sender: UIButton) {
        
        let message = Manager.shared.sell(quantity1: Int(myStepper1.value), quantity2: Int(myStepper2.value), quantity3: Int(myStepper3.value))
        
        let alert = UIAlertController(title: "Total sum:", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Pay", style: .default) { action in
            print(message)
            self.leftoversUpdate()
        }
        
        alert .addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    // проверка остатков || закрытие дня
    @IBAction func leftovers(_ sender: UIButton) {
        
        let message = Manager.shared.newShift(remnant1: Int(myStepper1.value), remnant2: Int(myStepper2.value), remnant3: Int(myStepper3.value))
        
        let alert = UIAlertController(title: "Remnants:", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            print(message)
            print("stepper1 max = \(self.myStepper1.maximumValue)")
            print("stepper2 max = \(self.myStepper2.maximumValue)")
            print("stepper3 max = \(self.myStepper3.maximumValue)")
        }
        
        alert .addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    // начало новой смены - обнуление выручки || новый день
    @IBAction func renewLeftovers(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Shift Ended!", message: "Time to go home!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Understood", style: .default, handler: {
            action in
            Manager.shared.restoreQuantity()
            self.returnMaxValues()
        })
        
        alert .addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func zeroLabels() {
        self.counter1.text = String(0)
        self.counter2.text = String(0)
        self.counter3.text = String(0)
        self.myStepper1.value = 0
        self.myStepper2.value = 0
        self.myStepper3.value = 0
    }
    
    func leftoversUpdate() {
        self.zeroLabels()
        self.myStepper1.maximumValue = self.myStepper1.maximumValue - self.myStepper1.value
        self.myStepper2.maximumValue = self.myStepper2.maximumValue - self.myStepper2.value
        self.myStepper3.maximumValue = self.myStepper3.maximumValue - self.myStepper3.value
    }
    
    func returnMaxValues () {
        self.zeroLabels()
        self.myStepper1.maximumValue = 100
        self.myStepper2.maximumValue = 100
        self.myStepper3.maximumValue = 100
    }
    
    
    
}

