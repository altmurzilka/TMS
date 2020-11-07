//
//  SettingsViewController.swift
//  ProjectRace
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let obstacles = ["tree", "rock", "ball", "log"]
    let vehicleColors = ["red", "white", "yellow", "black"]
    
    var myColor = "red"
    var myObstacle = "tree"
    
    
    @IBOutlet var carImage: UIImageView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var vehicleColorSegmentedControl: UISegmentedControl!
    @IBOutlet var ObstacleTypePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = UserDefaults.standard.value(UserSettings.self, forKey: "User") {
            usernameTextField.text = user.nickname
            carImage.image = UIImage(named: user.vehicleColor)
            vehicleColorSegmentedControl.selectedSegmentIndex = vehicleColors.firstIndex(of: user.vehicleColor)!
        }
    }
    
    @IBAction func colorChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            carImage.image = UIImage(named: "red")
            myColor = vehicleColors[0]
        case 1:
            carImage.image = UIImage(named: "white")
            myColor = vehicleColors[1]
        case 2:
            carImage.image = UIImage(named: "yellow")
            myColor = vehicleColors[2]
        case 3:
            carImage.image = UIImage(named: "black")
            myColor = vehicleColors[3]
        default:
            break
        }
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        let nameTrimmingText = usernameTextField.text!.trimmingCharacters(in: .whitespaces)
        let user = UserSettings(nickname: nameTrimmingText, vehicleColor: myColor, obstacleType: myObstacle)
        UserDefaults.standard.set(encodable: user, forKey: "User")
        self.navigationController?.popViewController(animated: true)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myObstacle = obstacles[row] as String
    }
}

