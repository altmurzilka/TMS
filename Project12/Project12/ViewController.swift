//
//  ViewController.swift
//  Project12
//
//  Created by Алтын on 10/29/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var myPicker: UIPickerView!
    
    var array = ["1", "2", "3", "4", "5", "6", "7", "8"]
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = array[0]
    }


}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.label.text = self.array[row]
    }
}
