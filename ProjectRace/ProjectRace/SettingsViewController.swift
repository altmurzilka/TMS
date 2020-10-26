//
//  SettingsViewController.swift
//  ProjectRace
//
//  Created by Алтын on 9/24/20.
//

import UIKit

enum Colors: String {
    case red
    case green
    case yellow
    case blue
}

class SettingsViewController: UIViewController {
    
    let obstacles = ["tree", "rock", "ball", "log"]
    let vehicleColors = ["red", "green", "yellow", "blue"]
    var pickedColor: Colors?
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var vehicleColorSegmentedControl: UISegmentedControl!
    @IBOutlet var ObstacleTypePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ObstacleTypePicker.delegate = self
        ObstacleTypePicker.dataSource = self
    }
    
    @IBAction func colorChange(_ sender: UISegmentedControl) {
        switch vehicleColorSegmentedControl.selectedSegmentIndex {
        case 0:
            pickedColor = .blue
        case 1:
            pickedColor = .green
        case 2:
            pickedColor = .yellow
        default:
            pickedColor = .red
        }
    }

    
    @IBAction func saveButton(_ sender: UIButton) {
        let nameTrimmingText = usernameTextField.text!.trimmingCharacters(in: .whitespaces)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}




extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return obstacles.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return obstacles[row]
    }
}

