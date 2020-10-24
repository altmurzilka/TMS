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

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var vehicleColorSegmentedControl: UISegmentedControl!
    @IBOutlet var ObstacleTypePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
