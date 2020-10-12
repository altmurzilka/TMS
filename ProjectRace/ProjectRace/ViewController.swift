//
//  ViewController.swift
//  ProjectRace
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var newGameButton: UIButton!
    @IBOutlet var recordsButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    
    var buttons = [UIButton]()
    
    @IBAction func NewGameButton(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewGameViewController") as! NewGameViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func RecordsButton(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RecordsViewController") as! RecordsViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func Settings(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [self.newGameButton, self.recordsButton, self.settingsButton]
        
        for i in buttons {
            i.customColor()
            i.dropShadow()
        }
    }
    
}

